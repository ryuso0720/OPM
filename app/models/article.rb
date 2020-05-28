class Article < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user

  has_many :likes
  has_many :users, through: :likes

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true
  validates :body, presence: true

  def self.search(search)
    return Article.all unless search
    Article.where('title LIKE(?)', "%#{search}%")
  end

  
end
