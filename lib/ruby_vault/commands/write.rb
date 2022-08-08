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
        %w[] + super
      end

      # @!visibility private
      def arguments(parameters)
        [parameters[:path]]
      end
    end
  end
end
