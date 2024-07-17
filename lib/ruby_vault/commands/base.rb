# frozen_string_literal: true

require 'lino'

require_relative '../errors'

module RubyVault
  module Commands
    class Base
      # rubocop:disable Metrics/AbcSize

      # Constructs an instance of the command.
      #
      def initialize(**opts)
        @binary  = opts[:binary]  || RubyVault.configuration.binary
        @logger  = opts[:logger]  || RubyVault.configuration.logger
        @options = opts[:options] || RubyVault.configuration.options
        @stdin   = opts[:stdin]   || RubyVault.configuration.stdin
        @stdout  = opts[:stdout]  || RubyVault.configuration.stdout
        @stderr  = opts[:stderr]  || RubyVault.configuration.stderr
      end

      # rubocop:enable Metrics/AbcSize

      # Executes the command instance.
      #
      # @param [Hash<String, Object>] parameters The parameters used to
      #   invoke the command. See subclass documentation for details of
      #   supported options.
      # @param [Hash<String, Object>] invocation_options Additional options
      #   controlling the invocation of the command.
      # @option invocation_options [Hash<String, String>] :environment A map
      #   of environment variables to expose at command invocation time.
      def execute(parameters = {}, invocation_options = {})
        do_before(parameters)
        build_and_execute_command(parameters, invocation_options)
        do_after(parameters)
      rescue Open4::SpawnError
        message = "Failed while running '#{command_name}'."
        logger.error(message)
        raise Errors::ExecutionError, message
      end

      protected

      attr_reader :binary, :logger, :stdin, :stdout, :stderr

      def build_and_execute_command(parameters, invocation_options)
        command = build_command(parameters, invocation_options)

        logger.debug("Running '#{command}'.")
        command.execute(
          stdin:,
          stdout:,
          stderr:
        )
      end

      def command_name
        self.class.to_s.split('::')[-1].downcase
      end

      def do_before(_parameters); end

      def do_after(_parameters); end

      private

      def build_command(parameters, invocation_options)
        parameters = resolve_parameters(parameters)
        environment = invocation_options[:environment] || {}

        Lino::CommandLineBuilder
          .for_command(@binary)
          .with_environment_variables(environment)
          .with_options_after_subcommands
          .with_option_separator('=')
          .with_appliables(@options.resolve(options, parameters))
          .with_subcommands(subcommands)
          .with_arguments(arguments(parameters).compact.flatten).build
      end

      def resolve_parameters(parameters)
        parameter_defaults(parameters)
          .merge(parameters)
          .merge(parameter_overrides(parameters))
      end

      def parameter_defaults(_parameters)
        {}
      end

      def parameter_overrides(_parameters)
        {}
      end

      def subcommands
        []
      end

      def options
        []
      end

      def arguments(_parameters)
        []
      end
    end
  end
end
