source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails'

group :test, :development, :production do
  gem 'bootsnap', require: false
  gem 'jbuilder'
  gem 'jquery-rails'
  gem 'sass-rails'
  gem 'terser'
  gem 'turbolinks'

  gem 'bootstrap'
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'draper'
  gem 'gon'
  gem 'google_drive'
  gem 'kaminari'
  gem 'listen'
  gem 'pg'
  gem 'pry'
  gem 'pry-rails'
  gem 'rb-readline'
  gem 'slim-rails'
  gem 'smarter_csv'
  gem 'twitter'
  gem 'unicorn'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'simplecov'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'

  gem 'capistrano3-unicorn', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rbenv', require: false

  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-byebug'
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara'
  gem 'puma'
  gem 'selenium-webdriver'
end
