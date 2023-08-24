class Enterprise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :address
  has_one_attached :image_one
  has_one_attached :image_two
  has_one_attached :image_three
end
