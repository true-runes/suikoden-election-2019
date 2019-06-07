class TargetUser < ApplicationRecord
  # TODO: リファクタリングする
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :target_tweets
  has_many :deleted_tweets
  # rubocop:enable Rails/HasManyOrHasOneDependent
end
