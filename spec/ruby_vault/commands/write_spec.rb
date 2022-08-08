# frozen_string_literal: true

require 'spec_helper'

describe RubyVault::Commands::Write do
  subcommand = 'write'

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
    'a command with a flag',
    described_class, subcommand, :force
  )

  it_behaves_like(
    'a command with an argument',
    described_class, subcommand, :path
  )

  it_behaves_like(
    'a command with an argument array',
    described_class, subcommand, :data
  )

  it_behaves_like(
    'a command with HTTP options',
    described_class, subcommand
  )

  it_behaves_like(
    'a command with output options',
    described_class, subcommand
  )
end
