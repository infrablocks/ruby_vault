# frozen_string_literal: true

if `uname` =~ /Darwin/
  notification(
    :terminal_notifier,
    app_name: 'ruby_vault ::',
    activate: 'com.googlecode.iTerm2'
  )
end

guard(
  :rspec,
  cmd: 'bundle exec rspec',
  all_after_pass: true,
  all_on_start: true
) do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)
end
