# frozen_string_literal: true

require_relative 'base'

module RubyVault
  module Commands
    class List < Base
      # @!visibility private
      def subcommands
        %w[list]
      end

      # @!visibility private
      def options
        super +
          Options::Sets::HTTP_OPTIONS +
          Options::Sets::OUTPUT_OPTIONS
      end

      # @!visibility private
      def arguments(parameters)
        [parameters[:path]].compact.flatten
      end
    end
  end
end
