require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module SuikodenElection2019
  class Application < Rails::Application
    config.load_defaults 5.2

    # DB への保存は UTC、画面表示は JST
    config.active_record.default_timezone = :utc
    config.time_zone = 'Asia/Tokyo'
  end
end
