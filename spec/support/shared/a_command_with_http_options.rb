# frozen_string_literal: true

shared_examples(
  'a command with HTTP options'
) do |command_klass, subcommand|
  %i[
    address
    agent_address
    ca_cert
    ca_path
    client_cert
    client_key
    mfa
    namespace
    tls_server_name
    unlock_key
  ].each do |option|
    it_behaves_like(
      'a command with an option',
      command_klass, subcommand, option
    )
  end
end
