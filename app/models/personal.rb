class Personal < ApplicationRecord
  belongs_to :user

  mount_uploader :icon_image, ImageUploader

  validates :profile, presence: true
  validates :icon_image, presence: true
end
