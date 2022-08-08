# frozen_string_literal: true

require_relative 'base'

module RubyVault
  module Commands
    class Login < Base
      # @!visibility private
      def subcommands
        %w[login]
      end

      # @!visibility private
      def options
        super +
          Options::Sets::HTTP_OPTIONS +
          Options::Sets::OUTPUT_OPTIONS +
          %w[
            -method
            -no-print
            -no-store
            -path
            -token-only
          ]
      end

      def arguments(parameters)
        [parameters[:auth]]
      end
    end
  end
end
