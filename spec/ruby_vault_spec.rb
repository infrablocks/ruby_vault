# frozen_string_literal: true

require 'spec_helper'

class RVIncluded
  include RubyVault
end

describe RubyVault do
  commands = {
    login: RubyVault::Commands::Login,
    write: RubyVault::Commands::Write,
    list: RubyVault::Commands::List
  }

  it 'has a version number' do
    expect(RubyVault::VERSION).not_to be_nil
  end

  it 'allows commands to be run without configure having been called' do
    allow(Open4).to(receive(:spawn))

    described_class.login(directory: 'some/path/to/configuration')
  end

  describe 'configuration' do
    before do
      described_class.reset!
    end

    it 'logs to standard output by default' do
      expect do
        described_class
          .configuration
          .logger
          .info('Logging with the default logger.')
      end.to output(/Logging with the default logger./).to_stdout
    end

    it 'has info log level by default' do
      expect(described_class.configuration.logger.level).to eq(Logger::INFO)
    end

    it 'allows default logger to be overridden' do
      string_io = StringIO.new
      logger = Logger.new(string_io)
      logger.level = Logger::DEBUG

      described_class.configure do |config|
        config.logger = logger
      end

      described_class
        .configuration
        .logger
        .debug('Logging with a custom logger at debug level.')

      expect(string_io.string)
        .to include('Logging with a custom logger at debug level.')
    end

    it 'has bare vault command as default binary' do
      expect(described_class.configuration.binary).to eq('vault')
    end

    it 'allows binary to be overridden' do
      described_class.configure do |config|
        config.binary = '/path/to/vault'
      end
      expect(described_class.configuration.binary).to eq('/path/to/vault')
    end

    it 'uses whatever $stdout points to for stdout by default' do
      expect(described_class.configuration.stdout).to eq($stdout)
    end

    it 'allows stdout stream to be overridden' do
      stdout = StringIO.new

      described_class.configure do |config|
        config.stdout = stdout
      end

      expect(described_class.configuration.stdout).to eq(stdout)
    end

    it 'uses whatever $stderr points to for stderr by default' do
      expect(described_class.configuration.stderr).to eq($stderr)
    end

    it 'allows stderr stream to be overridden' do
      stderr = StringIO.new

      described_class.configure do |config|
        config.stderr = stderr
      end

      expect(described_class.configuration.stderr).to eq(stderr)
    end

    it 'uses empty string for stdin by default' do
      expect(described_class.configuration.stdin).to eq('')
    end

    it 'allows stdin stream to be overridden' do
      stdin = StringIO.new("some\nuser\ninput\n")

      described_class.configure do |config|
        config.stdin = stdin
      end

      expect(described_class.configuration.stdin).to eq(stdin)
    end
  end

  describe 'vault commands' do
    commands.each do |method, command_class|
      describe ".#{method}" do
        let(:parameters) { { user: 'parameters' } }
        let(:invocation_options) do
          { environment: { 'SOME_ENV' => 'SOME_VALUE' } }
        end
        let(:instance) { instance_double(command_class, execute: nil) }

        before do
          allow(Open4).to receive(:spawn)
          allow(command_class).to receive(:new).and_return(instance)
          described_class.send(method, parameters, invocation_options)
        end

        it "creates an instance of the #{command_class} class and calls " \
           'its execute method' do
          expect(instance)
            .to(have_received(:execute)
                  .with(parameters, invocation_options))
        end
      end
    end
  end

  describe 'when included in a class' do
    commands.each_key do |method|
      it "exposes #{method} as a class method on the class" do
        expect(RVIncluded).to respond_to(method)
      end
    end
  end
end
