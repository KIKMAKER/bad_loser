class Point < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :value, presence: true
end
