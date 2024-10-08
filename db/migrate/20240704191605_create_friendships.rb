class CreateFriendships < ActiveRecord::Migration[7.1]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :friendships, [:user_id, :friend_user_id], unique: true
  end
end
