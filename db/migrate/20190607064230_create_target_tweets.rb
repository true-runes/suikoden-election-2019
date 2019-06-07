class CreateTargetTweets < ActiveRecord::Migration[5.2]
  # TODO: null: false, default: 'foobar' の付与
  def change
    create_table :target_tweets do |t|
      t.integer :collect_tweet_way_id
      t.integer :target_user_id

      t.integer :tweet_id
      t.string :text
      t.timestamp :tweeted_at

      # TODO: media_url_https #=> 別テーブルにしたほうがいい
      t.string :media_url_https_01
      t.string :media_url_https_02
      t.string :media_url_https_03
      t.string :media_url_https_04

      # TODO: expanded_url #=> 別テーブルにしたほうがいい
      # TODO: ここでは最大一個までを取得しているので二個目以降は捨てられてる
      t.string :expanded_url

      t.string :lang
      t.boolean :is_retweet

      t.timestamps

      # hashtags #=> HACK: 別テーブルにしたほうがいい
      # user_mentions #=> HACK: 別テーブルにしたほうがいい
    end

    add_index :target_tweets, :text
  end
end
