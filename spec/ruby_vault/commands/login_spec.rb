# frozen_string_literal: true

require 'spec_helper'

describe RubyVault::Commands::Login do
  subcommand = 'login'
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
    described_class, subcommand
  )

  it_behaves_like(
    'a command with an option',
    described_class, subcommand, :method
  )

  it_behaves_like(
    'a command with an argument array',
    described_class, subcommand, :auth
  )

  it_behaves_like(
    'a command with HTTP options',
    described_class, subcommand
  )
end
