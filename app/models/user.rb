class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :boards, through: :friendships
  has_many :friends, through: :friendships, source: :friend_user
  has_many :points, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 12 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  def all_friendships
    Friendship.where('user_id = :id OR friend_user_id = :id', id: self.id)
  end

  def all_boards
    Board.joins(:friendship).merge(Friendship.where('user_id = ? OR friend_user_id = ?', self.id, self.id))
  end
end
