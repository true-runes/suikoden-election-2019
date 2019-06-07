class CreateRawTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :raw_tweets do |t|
      t.integer :target_tweet_id
      t.text :target_tweet_object

      t.timestamps
    end
  end
end
