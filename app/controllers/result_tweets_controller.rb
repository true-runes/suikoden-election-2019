class ResultTweetsController < ApplicationController
  def index
    @result_tweets = TargetTweet.result_tweets
  end
end