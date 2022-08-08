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
        super
          .concat(Options::Sets::HTTP_OPTIONS)
          .concat(['-method'])
      end

      def arguments(parameters)
        [parameters[:auth]]
      end
    end
  end
end
