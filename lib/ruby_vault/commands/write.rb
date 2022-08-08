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
        super +
          Options::Sets::HTTP_OPTIONS +
          Options::Sets::OUTPUT_OPTIONS + %w[
            -force
          ]
      end

      # @!visibility private
      def arguments(parameters)
        [parameters[:path], parameters[:data]].flatten
      end
    end
  end
end
