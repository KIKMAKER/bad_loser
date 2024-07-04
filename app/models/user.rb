class User < ApplicationRecord

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend_user

  has_many :boards, dependent: :destroy
  has_many :points, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
