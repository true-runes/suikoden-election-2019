class CreateCollectTweetWays < ActiveRecord::Migration[5.2]
  def change
    create_table :collect_tweet_ways do |t|
      t.string :name
      t.string :parameter

      t.timestamps
    end

    add_index :collect_tweet_ways, [:name, :parameter], unique: true
  end
end
