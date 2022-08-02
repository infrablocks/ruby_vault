# RubyVault

A simple wrapper around the Vault binary to allow execution from within
a Ruby program, RSpec test or Rakefile.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_vault'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_vault

## Usage

To require `RubyVault`:

```ruby
require 'ruby_vault'
```

## Documentation

* [API docs](https://infrablocks.github.io/ruby_vault/index.html)

## Development

To install dependencies and run the build, run the pre-commit build:

```shell script
./go
```

This runs all unit tests and other checks including coverage and code linting /
formatting.

To run only the unit tests, including coverage:

```shell script
./go test:unit
```

To attempt to fix any code linting / formatting issues:

```shell script
./go library:fix
```

To check for code linting / formatting issues without fixing:

```shell script
./go library:check
```

You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

### Managing CircleCI keys

To encrypt a GPG key for use by CircleCI:

```bash
openssl aes-256-cbc \
  -e \
  -md sha1 \
  -in ./config/secrets/ci/gpg.private \
  -out ./.circleci/gpg.private.enc \
  -k "<passphrase>"
```

To check decryption is working correctly:

```bash
openssl aes-256-cbc \
  -d \
  -md sha1 \
  -in ./.circleci/gpg.private.enc \
  -k "<passphrase>"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/infrablocks/ruby_vault. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).