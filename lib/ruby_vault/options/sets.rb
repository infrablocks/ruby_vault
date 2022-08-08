# frozen_string_literal: true

module RubyVault
  module Options
    module Sets
      HTTP_OPTIONS = %w[
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
      ].freeze
    end
  end
end
