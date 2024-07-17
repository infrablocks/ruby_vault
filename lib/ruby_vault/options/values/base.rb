# frozen_string_literal: true

require 'immutable-struct'

module RubyVault
  module Options
    module Values
      class Base < ImmutableStruct.new(:value)
        def initialize(value)
          super(value:)
        end
      end
    end
  end
end
