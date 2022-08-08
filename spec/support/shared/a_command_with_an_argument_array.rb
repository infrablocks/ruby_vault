# frozen_string_literal: true

shared_examples(
  'a command with an argument array'
) do |command_klass, subcommand, argument|
  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the vault #{subcommand} command passing no arguments " \
      "when #{argument} not provided",
    expected: "vault #{subcommand}",
    binary: 'vault',
    parameters: {}
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the vault #{subcommand} command passing no arguments " \
      "when #{argument} is empty",
    expected: "vault #{subcommand}",
    binary: 'vault',
    parameters: {
      argument => []
    }
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the vault #{subcommand} command passing the supplied value k=v " \
      "from #{argument}",
    expected: "vault #{subcommand} k=v",
    binary: 'vault',
    parameters: {
      argument => ['k=v']
    }
  )

  it_behaves_like(
    'a valid command line',
    command_klass,
    reason:
      "calls the vault #{subcommand} command passing the supplied values " \
      "k1=v1, k2=v2 from #{argument}",
    expected: "vault #{subcommand} k1=v1 k2=v2",
    binary: 'vault',
    parameters: {
      argument => %w[k1=v1 k2=v2]
    }
  )
end
