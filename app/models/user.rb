class User < ApplicationRecord

  has_many :friendships
  has_many :friends, through: :friendships, source: :friend_user

  has_many :boards
  has_many :points

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
