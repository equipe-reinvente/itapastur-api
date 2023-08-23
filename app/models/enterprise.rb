class Enterprise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :enterprise_photo
  has_one :address, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
