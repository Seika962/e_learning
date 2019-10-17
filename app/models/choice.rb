class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy

  validates :content, presence: true, length: {maximum: 50}


end
