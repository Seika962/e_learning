class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
  end
  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.new(user:current_user)
      if @lesson.save
        redirect_to new_lesson_answer_url(@lesson)
      end
  end
end
