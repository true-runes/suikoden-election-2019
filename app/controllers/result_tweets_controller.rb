class ResultTweetsController < ApplicationController
  def index
    @result_tweets = TargetTweet.result_tweets.order('tweet_id desc').page(params[:page])
  end
end
