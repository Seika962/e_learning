class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = @lesson.category
    @answer = @lesson.answers.new
  end
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)
    # if @lesson.next_word.nil?
    #   show result
    # else
      @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    # end
  end

  private
  def answer_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id )
  end
end
