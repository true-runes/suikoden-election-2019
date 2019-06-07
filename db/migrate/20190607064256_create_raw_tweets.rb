class CreateRawTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :raw_tweets do |t|
      t.integer :tweet_id
      t.text :target_tweet_object

      t.timestamps
    end

    add_index :raw_tweets, :tweet_id, unique: true
  end
end
