source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.2'

gem 'rails'

gem 'bootsnap', require: false
gem 'bootstrap'
gem 'csv'
gem 'dotenv-rails'
gem 'draper'
gem 'gon'
gem 'google_drive'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kaminari'
gem 'listen'
gem 'mutex_m'
gem 'observer'
gem 'ostruct'
gem 'pg'
gem 'puma'
gem 'rb-readline'
gem 'sass-rails'
gem 'slim-rails'
gem 'terser' # JavaScript の圧縮用の gem
gem 'turbolinks'
gem 'twitter'

group :development do
  gem 'bullet'
  gem 'web-console'

  gem 'awesome_print'
  gem 'better_errors' # "better_errors" と "binding_of_caller" がペアとなり、エラー時に Web にわかりやすい表示をする
  gem 'binding_of_caller' # "better_errors" と "binding_of_caller" がペアとなり、エラー時に Web にわかりやすい表示をする
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'simplecov' # カバレッジをちゃんと扱えていないなら（まだ）不要なので削除する
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
