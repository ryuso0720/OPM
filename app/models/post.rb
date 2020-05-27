class Post < ApplicationRecord
  belongs_to :user

  validates :time, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..24 }

end
