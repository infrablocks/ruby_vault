# frozen_string_literal: true

module RubyVault
  module Options
    HTTP_DEFINITIONS = [
      %w[
        -address
        -agent-address
        -ca-cert
        -ca-path
        -client-cert
        -client-key
        -mfa
        -namespace
        -tls-server-name
        -unlock-key
      ].map do |o|
        definition(name: o, option_type: :standard, value_type: :string)
      end
    ].flatten.freeze

    OTHER_DEFINITIONS = [
      # string options
      %w[
        -method
      ].map do |o|
        definition(name: o, option_type: :standard, value_type: :string)
      end
    ].flatten.freeze

    DEFINITIONS = (HTTP_DEFINITIONS + OTHER_DEFINITIONS).flatten.freeze
  end
end
