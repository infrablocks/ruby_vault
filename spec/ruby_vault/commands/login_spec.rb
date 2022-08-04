# frozen_string_literal: true

require 'spec_helper'

describe RubyVault::Commands::Login do
  before do
    RubyVault.configure do |config|
      config.binary = 'path/to/binary'
    end
  end

  after do
    RubyVault.reset!
  end

  it_behaves_like(
    'a command without a binary supplied',
    described_class, 'login'
  )

  it_behaves_like(
    'a command with an option',
    described_class, 'login', :method
  )
end
