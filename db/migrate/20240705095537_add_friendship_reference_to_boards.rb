class AddFriendshipReferenceToBoards < ActiveRecord::Migration[7.1]
  def change
    add_reference :boards, :friendship, foreign_key: true
  end
end
