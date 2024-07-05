class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User'
  has_many :boards, dependent: :destroy

  validates :user_id, presence: true
  validates :friend_user_id, presence: true

end
