class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates :content, presence: true, length: {maximum: 50}
  validate :has_one_correct

  def correct_answer
    choices.find_by(is_correct: true)
  end

  private
  def has_one_correct
    unless choices.collect {|choice| choice.is_correct? }.count(true) == 1
      # collect the true choice checking one by one and count the number and check if there is only one of it
      # just taking information from the form, not saving in the database
      errors.add(:choices, "should have one correct answer")
    end
  end
end
