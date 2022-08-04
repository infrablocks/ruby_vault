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
        %w[
          -method
        ] + super
      end
    end
  end
end
