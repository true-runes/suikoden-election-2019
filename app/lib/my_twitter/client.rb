# rubocop:disable Style/FetchEnvVar
module MyTwitter
  module Client
    def initialize
      @my_twitter_client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token        = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end
    end
  end
end
# rubocop:enable Style/FetchEnvVar
