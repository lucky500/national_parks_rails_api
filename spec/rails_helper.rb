# require 'factory_bot_rails'
# require 'support/factory_bot'


ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'
require 'database_cleaner'

  # added this line so my json helper method would work
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!


Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|

  # did not need this line to make FactoryBot work
  config.include FactoryBot::Syntax::Methods

  # start by truncating all the tables but then use the faster transaction strategy the rest of the time.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  # start the transaction strategy as examples are run
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  # [...]

  # added this line so my json helper method would work
  config.include RequestSpecHelper, type: :request

end

# RSpec.configure do |config|
#   config.fixture_path = "#{::Rails.root}/spec/fixtures"
#   config.use_transactional_fixtures = true
#   config.infer_spec_type_from_file_location!
#   config.filter_rails_from_backtrace!
# end