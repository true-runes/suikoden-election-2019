class TargetUser < ApplicationRecord
  has_many :target_tweets
  has_many :deleted_tweets
end
