class CreateTargetUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :target_users do |t|
      t.bigint :twitter_user_id
      t.string :name
      t.string :screen_name
      t.string :profile_image_url_https
      # t.boolean :is_protected
      t.string :lang

      t.timestamps
    end

    add_index :target_users, :twitter_user_id, unique: true
    add_index :target_users, :screen_name
  end
end
