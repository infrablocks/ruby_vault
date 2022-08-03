# frozen_string_literal: true

require 'spec_helper'

describe RubyVault do
  it 'has a version number' do
    expect(RubyVault::VERSION).not_to be_nil
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
  end
end

