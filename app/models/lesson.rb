class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  has_one :activity, as: :action, dependent: :destroy

  def next_word
    (category.words - words).first
    # first word of (all the words related to category - words related to answers which is the words you already answered)
  end
  def correct_answer
    choices.where(is_correct:true).count
    # counting the number of correct answer in all the choices of the user
  end
 
end
