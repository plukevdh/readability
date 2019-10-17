source "http://rubygems.org"

gem "rails", "3.2.17"
gem "sqlite3"

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
group :test do
  gem 'simplecov'

  gem 'cucumber', require: nil
  gem 'capybara', require: nil
  gem 'database_cleaner', require: nil
  gem 'launchy'
  gem 'pickle', require: nil

  gem 'rspec', '~> 2.5'
  gem 'ffaker'
  gem 'factory_girl'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'rspec-rails', '>= 2.0.1'
  gem 'ruby-debug-base19', '>= 0.11.24', require: nil
  gem 'ruby-debug19', '>= 0.11.6', require: nil
end

gem 'yajl-ruby'
gem 'oauth'
