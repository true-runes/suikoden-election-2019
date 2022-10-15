class TargetTweet < ApplicationRecord
  # TODO: リファクタリングする
  belongs_to :target_user
  # belongs_to :collect_tweet_ways

  paginates_per 10

  start_vote_time = '2019-06-07 21:00:00 JST'
  end_vote_time   = '2019-06-09 10:00:00 JST'

  start_result_announcement_time = '2019-06-15 18:00:00 JST'
  end_result_announcement_time   = '2019-06-16 09:00:00 JST'

  # TODO: 2014年の書き方であり、もっとスマートな書き方が絶対にあるはずだろ
  # https://stackoverflow.com/questions/20942672/rails-scope-returns-all-instead-of-nil
  def self.name_of_voting_by_tweet_id(tweet_id)
    TargetTweet
      .find_by(tweet_id: tweet_id)
      &.target_user
      &.name
  end

  def self.screen_name_of_voting_by_tweet_id(tweet_id)
    TargetTweet
      .find_by(tweet_id: tweet_id)
      &.target_user
      &.screen_name
  end

  # HACK: 複数形のほうが良かったかも
  scope :valid_vote,
        lambda {
          where(tweeted_at: start_vote_time..end_vote_time)
            .where(is_retweet: false)
            .where.not(target_user_id: TargetUser.gensosenkyo.id)
        }

  scope :gensui_oshi_serifu,
        lambda {
          where(is_retweet: false)
            .where.not(target_user_id: TargetUser.gensosenkyo.id)
            .where(collect_tweet_way_id: 4)
        }

  scope :result_tweets,
        lambda {
          where(tweeted_at: start_result_announcement_time..end_result_announcement_time)
            .where(is_retweet: false)
            .where(target_user_id: TargetUser.gensosenkyo.id)
        }
end
