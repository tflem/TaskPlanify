ENV["RAILS_ENV"] ||= "test"
require "simplecov"
require "simplecov-console"
SimpleCov.start "rails" unless ENV["NO_COVERAGE"]
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

SimpleCov.formatter = SimpleCov.formatter =
SimpleCov::Formatter::Console

SimpleCov.start

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  def is_signed_in?
    !session[:user_id].nil?
  end
end
