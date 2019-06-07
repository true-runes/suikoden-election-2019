class TargetUser < ApplicationRecord
  # TODO: リファクタリングする
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :target_tweets
  has_many :deleted_tweets
  # rubocop:enable Rails/HasManyOrHasOneDependent

  TWITTER_USER_ID_GENSOSENKYO = 1_471_724_029

  # TODO: この first って挟むの非生産的なので、きっと何かスマートな方法がある
  def self.gensosenkyo
    TargetUser.
      where(twitter_user_id: TWITTER_USER_ID_GENSOSENKYO)&.
      first
  end
end
