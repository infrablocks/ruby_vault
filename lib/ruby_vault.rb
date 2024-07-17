# frozen_string_literal: true

require_relative 'ruby_vault/options'
require_relative 'ruby_vault/version'
require_relative 'ruby_vault/commands'
require 'logger'

module RubyVault
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset!
      @configuration = nil
    end
  end

  module ClassMethods
    def login(parameters = {}, invocation_options = {})
      exec(RubyVault::Commands::Login,
           parameters, invocation_options)
    end

    def write(parameters = {}, invocation_options = {})
      exec(RubyVault::Commands::Write,
           parameters, invocation_options)
    end

    def list(parameters = {}, invocation_options = {})
      exec(RubyVault::Commands::List,
           parameters, invocation_options)
    end

    private

    def exec(command_class, parameters, invocation_options)
      command_class.new.execute(parameters, invocation_options)
    end
  end

  extend ClassMethods

  def self.included(other)
    other.extend(ClassMethods)
  end

  class Configuration
    attr_accessor :binary, :logger, :options, :stdin, :stdout, :stderr

    def default_logger
      logger = Logger.new($stdout)
      logger.level = Logger::INFO
      logger
    end

    def default_options
      Options::Factory.new(Options::DEFINITIONS)
    end

    def initialize
      @binary = 'vault'
      @logger = default_logger
      @options = default_options
      @stdin = nil
      @stdout = $stdout
      @stderr = $stderr
    end
  end
end
