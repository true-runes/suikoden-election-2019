require 'rails_helper'

# Only NOT production environments such as development and test
def visit_with_http_auth(target_path)
  username = ENV['BASIC_AUTH_USERNAME']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{target_path}"
end

RSpec.feature 'ベーシック認証', type: :system do
  xscenario '登録されているIDとパスワードで認証が成功すること' do
    visit_with_http_auth root_path
    expect(page).to have_content '幻水総選挙2019'
  end

  xscenario '登録されていないIDとパスワードでは認証が失敗すること' do
    username    = 'foo'
    password    = 'bar'
    target_path = root_path

    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{target_path}"

    expect(page).to have_content 'HTTP Basic: Access denied.'
  end
end
