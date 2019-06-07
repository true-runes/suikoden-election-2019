class TargetTweet < ApplicationRecord
  # TODO: リファクタリングする
  belongs_to :target_user
  # belongs_to :collect_tweet_ways

  start_vote_time = '2019-06-07 21:00:00 JST'
  end_vote_time   = '2019-06-09 09:00:00 JST'

  scope :name_of_voting_by_tweet_id,
        ->(tweet_id) {
          where(tweet_id: tweet_id).
          first.
          target_user.
          name
        }
  scope :screen_name_of_voting_by_tweet_id,
        ->(tweet_id) {
          where(tweet_id: tweet_id).
          first&.
          target_user&.
          screen_name
        }
  scope :valid_vote,
        -> {
          where(tweeted_at: (start_vote_time)..(end_vote_time)).
          where(is_retweet: false)
        }
end
