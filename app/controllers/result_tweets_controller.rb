class ResultTweetsController < ApplicationController
  def index
    @result_tweets = TargetTweet.result_tweets.page(params[:page])
  end
end
