# frozen_string_literal: true

module RubyVault
  module Options
    module Types
      class Flag < ImmutableStruct.new(
        :name,
        :value
      )
        def initialize(name, value, **_opts)
          super(name:, value:)
        end

        def apply(builder)
          value.resolve ? builder.with_flag(name) : builder
        end
      end
    end
  end
end
