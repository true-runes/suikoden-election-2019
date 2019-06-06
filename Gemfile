source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 5.2.3'

gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'rubocop-rails', require: false
gem 'twitter'

group :development do
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-unicorn', require: false

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'awesome_print'
end

group :test, :development, :production do
  gem 'unicorn'
  gem 'dotenv-rails'
  gem 'draper'
  gem 'pg'
  gem 'bullet'
  gem 'slim-rails'
  gem 'kaminari'
  gem 'smarter_csv'
  gem 'gon'
  gem 'google_drive'
end

group :test, :development do
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

# gem 'activerecord-import' # BULK INSERT をするための gem https://qiita.com/xend/items/79184ded56158ea1b97a
# gem 'simple_form'
# gem 'search_cop'
