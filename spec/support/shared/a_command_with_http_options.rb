# frozen_string_literal: true

shared_examples(
  'a command with HTTP options'
) do |command_klass, subcommand|
  [:address].each do |option|
    it_behaves_like(
      'a command with an option',
      command_klass, subcommand, option
    )
  end
end
