class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :answers, through: :lessons
  # this is making a connection between categories and users who have already taken the lessons of the category.
  validates :title, presence: true, length: {maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }


end
