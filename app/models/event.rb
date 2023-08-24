class Event < ApplicationRecord
  belongs_to :address
  belongs_to :enterprise
  has_one_attached :image
end
