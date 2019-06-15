class TargetTweet < ApplicationRecord
  # TODO: リファクタリングする
  belongs_to :target_user
  # belongs_to :collect_tweet_ways

  start_vote_time = '2019-06-07 21:00:00 JST'
  end_vote_time   = '2019-06-09 10:00:00 JST'

  # TODO: 2014年の書き方であり、もっとスマートな書き方が絶対にあるはずだろ
  # https://stackoverflow.com/questions/20942672/rails-scope-returns-all-instead-of-nil
  def self.name_of_voting_by_tweet_id(tweet_id)
    TargetTweet.
      find_by(tweet_id: tweet_id)&.
      target_user&.
      name
  end

  def self.screen_name_of_voting_by_tweet_id(tweet_id)
    TargetTweet.
      find_by(tweet_id: tweet_id)&.
      target_user&.
      screen_name
  end

  scope :valid_vote,
        -> {
          where(tweeted_at: start_vote_time..end_vote_time).
          where(is_retweet: false).
          where.not(target_user_id: TargetUser.gensosenkyo.id)
        }
<<<<<<< HEAD

  scope :oshi_serif,
        -> {
          where(is_retweet: false).
          where.not(target_user_id: TargetUser.gensosenkyo.id).
          where(collect_tweet_way_id: 4) # TODO: ハードコーディングを撤廃する
        }
||||||| merged common ancestors
=======

  scope :gensui_oshi_serifu,
        -> {
          where(is_retweet: false).
          where.not(target_user_id: TargetUser.gensosenkyo.id).
          where(collect_tweet_way_id: 4)
        }
>>>>>>> development
end
