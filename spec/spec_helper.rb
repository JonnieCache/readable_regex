require 'bundler/setup'
Bundler.require(:default, :test)

require File.expand_path("../../readable_regex.rb", __FILE__)
require 'rspec/autorun'

RSpec.configure do |config|
  config.mock_with :rspec
end