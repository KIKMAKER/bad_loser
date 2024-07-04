class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :game, null: false
      t.integer :winner
      t.references :user, null: false, foreign_key: true
      t.references :friend_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
