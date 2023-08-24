class Event < ApplicationRecord
  belongs_to :enterprise
  has_one :address, dependent: :destroy
  has_one_attached :image
end
