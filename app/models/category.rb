class Category < ApplicationRecord
  has_many :words
  has_many :lessons, dependent: :destroy
  validates :title, presence: true, length: {maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
end
