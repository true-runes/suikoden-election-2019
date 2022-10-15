module Pages
  class CheckMyVoteController < ApplicationController
    def index
      # params[:screen_name] が nil のときというのは、ページ遷移で訪れたときである
      if params[:screen_name].nil?
        @screen_name    = nil
        @target_user    = nil
        @target_tweets  = nil
      else
        @screen_name = params[:screen_name]
        @screen_name.gsub!(/^@/, '')
        @target_user   = TargetUser.where(screen_name: @screen_name)
        @target_tweets = TargetUser.search_tweet_by_screen_name(@screen_name)
      end

      target_user_information
      target_tweets_information
    end

    # TODO: コントローラに詰め込み過ぎなので、デコレータを検討すること
    private

    # @target_user に依存している
    def target_user_information
      @target_user_name         = @target_user&.first&.name
      @target_user_screen_name  = @target_user&.first&.screen_name
      @target_user_icon_uri     = @target_user&.first&.profile_image_url_https
    end

    # @target_tweets に依存している
    def target_tweets_information # rubocop:disable Metrics/AbcSize
      @target_tweets_count = @target_tweets.nil? ? 0 : @target_tweets.count

      @target_tweets_contents = []
      @target_tweets&.each do |tweet|
        inserted_hash = {}

        inserted_hash['tweet_id']   = tweet.tweet_id
        inserted_hash['text']       = tweet.text
        inserted_hash['tweeted_at'] = tweet.tweeted_at
        inserted_hash['media_url_https_01'] = tweet.media_url_https_01
        inserted_hash['media_url_https_02'] = tweet.media_url_https_02
        inserted_hash['media_url_https_03'] = tweet.media_url_https_03
        inserted_hash['media_url_https_04'] = tweet.media_url_https_04

        # rubocop:disable Layout/LineLength
        if inserted_hash['media_url_https_01'].nil? && inserted_hash['media_url_https_02'].nil? && inserted_hash['media_url_https_03'].nil? && inserted_hash['media_url_https_04'].nil?
          inserted_hash['exists_media'] = false
        else
          inserted_hash['exists_media'] = true
        end
        # rubocop:enable Layout/LineLength

        @target_tweets_contents << inserted_hash
      end
    end
  end
end
