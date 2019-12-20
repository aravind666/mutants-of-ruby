# frozen_string_literal: true

# The spec_helper file is the place for loading up any code needed
# by all tests (especially the code being targeted by the tests).
require 'simplecov'
SimpleCov.minimum_coverage 99
SimpleCov.minimum_coverage_by_file 98
SimpleCov.maximum_coverage_drop 0.50
SimpleCov.start do
  add_filter '/spec/' # defering coverage for spec files is not required
end if ENV["COVERAGE"]

require 'guide'
require './spec/helpers/extract_helpers'

# Set the application root for easy reference.
APP_ROOT = File.expand_path('..', __dir__)

RSpec.configure do |config|
  config.include ExtractHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def no_output
  original_stdout = $stdout.dup
  $stdout.reopen('/dev/null')
  $stdout.sync = true
  begin
    yield
  ensure
    $stdout.reopen(original_stdout)
  end
end

def capture_output
  original_stdout = $stdout.dup
  output_catcher = StringIO.new
  $stdout = output_catcher
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  output_catcher.string
end

def setup_fake_input(*args)
  allow(Readline).to receive(:readline).and_return(*args)
end

# clean up by deleting created files
def remove_created_file(file_path)
  File.delete(file_path) if file_path && File.exist?(file_path)
end
