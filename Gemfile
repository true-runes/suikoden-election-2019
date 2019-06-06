source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 5.2.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

gem 'rubocop-rails', require: false
gem 'twitter'

group :development do
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-unicorn', require: false

  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
end

group :test, :development, :production do
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'draper'
  gem 'gon'
  gem 'google_drive'
  gem 'kaminari'
  gem 'pg'
  gem 'slim-rails'
  gem 'smarter_csv'
  gem 'unicorn'
end

group :test, :development do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'simplecov'
end

# gem 'activerecord-import' # BULK INSERT をするための gem https://qiita.com/xend/items/79184ded56158ea1b97a
# gem 'simple_form'
# gem 'search_cop'
