class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :articles

  has_many :likes
  has_many :articles, through: :likes

  has_one :personal

  validates :name, presence: true, uniqueness: true
end
