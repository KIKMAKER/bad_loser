class Board < ApplicationRecord
  belongs_to :friendship
  has_many :points, dependent: :destroy

  validates :name, presence: true
  validates :game, presence: true
  
  has_one_attached :picture
end
