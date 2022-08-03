# frozen_string_literal: true

require 'ruby_vault/options'
require 'ruby_vault/version'
require 'logger'

module RubyVault
  class << self

    def configuration
      @configuration ||= Configuration.new
    end

    def reset!
      @configuration = nil
    end
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
      @binary = 'terraform'
      @logger = default_logger
      @options = default_options
      @stdin = ''
      @stdout = $stdout
      @stderr = $stderr
    end
  end


end
