class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  # validate :picture_size

  # private
  # # Validates the size of an uploaded picture.
  # def picture_size
  #   errors.add(:image, 'should be less than 1MB') if image.size > 1.megabytes
  # end
end
