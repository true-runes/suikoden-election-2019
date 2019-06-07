class TargetTweet < ApplicationRecord
  # TODO: リファクタリングする
  belongs_to :target_user
  # belongs_to :collect_tweet_ways
end
