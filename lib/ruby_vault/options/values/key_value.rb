# frozen_string_literal: true

require 'immutable-struct'

module RubyVault
  module Options
    module Values
      class KeyValue < ImmutableStruct.new(:key, :value)
        def initialize(key, value)
          super(key: key, value: value)
        end

        def resolve
          { key => value.resolve }
        end

        def render
          "'#{key}=#{value.render}'"
        end
      end
    end
  end
end
