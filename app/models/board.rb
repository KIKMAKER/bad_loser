class Board < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User'
  has_many :points, dependent: :destroy
  has_one_attached :picture
end
