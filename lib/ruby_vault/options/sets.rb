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
        -header
        -mfa
        -namespace
        -non-interactive
        -output-curl-string
        -output-policy
        -policy-override
        -tls-server-name
        -tls-skip-verify
        -unlock-key
        -wrap-ttl
      ].freeze
    end
  end
end
