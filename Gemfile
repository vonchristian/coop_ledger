source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "ancestry"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem 'money-rails', '~>1.12'
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 2.0"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bcrypt", "~> 3.1.7"
gem 'simple_form'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "font-awesome-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry", "~> 0.13.1"
  gem 'rspec-rails', '~> 5.0.0'
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "bullet"
  gem "rack-mini-profiler", "~> 2.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "database_cleaner-active_record"
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", require: false
  gem "webdrivers"
end
