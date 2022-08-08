# frozen_string_literal: true

require 'spec_helper'

describe RubyVault::Options::Values::KeyValue do
  describe '#resolve' do
    it 'returns key value pair as a map' do
      value = RubyVault::Options::Values::String.new('thing')
      expect(described_class.new('a', value).resolve)
        .to(eq({ 'a' => 'thing' }))
    end
  end

  describe '#render' do
    it 'returns quoted key value pair' do
      value = RubyVault::Options::Values::Complex.new([1, 2, 3])
      expect(described_class.new('a', value).render)
        .to(eq("'a=[1,2,3]'"))
    end
  end
end
