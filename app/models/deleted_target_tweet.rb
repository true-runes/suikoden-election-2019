class DeletedTargetTweet < ApplicationRecord
  belongs_to :target_user
  belongs_to :collect_tweet_ways
end
