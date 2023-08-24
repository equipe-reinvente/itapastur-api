class Enterprise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :address, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images
end
