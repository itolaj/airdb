ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

    #Shoulda::Matchers.configure do |config|
    #config.integrate do |with|
      # Choose a test framework:
      #with.test_framework :rspec
      #with.test_framework :minitest
      #with.test_framework :minitest_4
      #with.test_framework :test_unit

      # Choose one or more libraries:
      #with.library :active_record
      #with.library :active_model
      #with.library :action_controller
      # Or, choose the following (which implies all of the above):
      #with.library :rails
    #end
  #end
end
