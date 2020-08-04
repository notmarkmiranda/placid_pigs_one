source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false

gem "devise"
gem "draper"
gem "font-awesome-rails"
gem "pundit"
gem 'skeleton-rails', :git => 'https://github.com/helios-technologies/skeleton-rails'

group :development, :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "pry"
  gem "rspec-rails", "~> 4.0.1"
  gem "standard"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
end

group :test do
  gem "database_cleaner-active_record"
  gem "launchy"
  gem "shoulda-matchers", "~> 4.0"
  gem "simplecov", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
