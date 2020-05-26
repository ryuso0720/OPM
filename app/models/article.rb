class Article < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user

  has_many :likes
  has_many :users, through: :likes

  accepts_nested_attributes_for :photos

  
end
