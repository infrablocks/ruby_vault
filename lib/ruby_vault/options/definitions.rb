# frozen_string_literal: true

module RubyVault
  module Options
    DEFINITIONS = [
      # string options
      %w[
        -method
        -address
      ].map do |o|
        definition(name: o, option_type: :standard, value_type: :string)
      end
    ].flatten.freeze
  end
end
