class RemoveUserAndFriendUserReferencesFromBoards < ActiveRecord::Migration[7.1]
  def change
    remove_reference :boards, :user, foreign_key: true
    remove_reference :boards, :friend_user, foreign_key: { to_table: :users }
  end
end
