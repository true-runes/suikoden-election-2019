class ApplicationController < ActionController::Base
  before_action :basic_auth

  def basic_auth
    unless Rails.env.production?
      authenticate_or_request_with_http_basic do |user, password|
        user == ENV.fetch('BASIC_AUTH_USERNAME') && password == ENV.fetch('BASIC_AUTH_PASSWORD')
      end
    end
  end
end
