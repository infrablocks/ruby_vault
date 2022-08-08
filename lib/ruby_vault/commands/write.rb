# frozen_string_literal: true

require_relative 'base'

module RubyVault
  module Commands
    class Write < Base
      # @!visibility private
      def subcommands
        %w[write]
      end

      # @!visibility private
      def options
        super + Options::Sets::HTTP_OPTIONS
      end

      # @!visibility private
      def arguments(parameters)
        [parameters[:path]]
      end
    end
  end
end
