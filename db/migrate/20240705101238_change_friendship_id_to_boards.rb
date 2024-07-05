class ChangeFriendshipIdToBoards < ActiveRecord::Migration[7.1]
  def change
    change_column_null :boards, :friendship_id, false
  end
end
