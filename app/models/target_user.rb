class TargetUser < ApplicationRecord
  # TODO: リファクタリングする
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :target_tweets
  has_many :deleted_tweets
  # rubocop:enable Rails/HasManyOrHasOneDependent

  TWITTER_USER_ID_GENSOSENKYO = 1_471_724_029

  # TODO: この first って挟むの非生産的なので、きっと何かスマートな方法がある
  # TODO: => find_by がまさにそれらしい（戻り値のクラスに注意）
  def self.gensosenkyo
    TargetUser
      .where(twitter_user_id: TWITTER_USER_ID_GENSOSENKYO)
      &.first
  end

  def self.search_tweet_by_screen_name(screen_name)
    if TargetUser.find_by(screen_name: screen_name).nil?
      nil
    else
      target_user_id = TargetUser.find_by(screen_name: screen_name)[:id]
      TargetTweet.valid_vote.where(target_user_id: target_user_id)
    end
  end
end
