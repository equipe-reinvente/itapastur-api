class User < ApplicationRecord
    has_secure_password
    has_many :favorites, dependent: :destroy
    has_one_attached :avatar
end