class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers

  validates :content, presence: true, length: {maximum: 50}


end
