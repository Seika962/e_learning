class WordsController < ApplicationController
  def index
    if params[:category]
      @category = Category.find(params[:category])
      @words = @category.answers.paginate(page:params[:page],per_page:10)
    else
      @words = current_user.answers.paginate(page:params[:page],per_page:10)
    end

    @categories = current_user.categories.left_outer_joins(:lessons).where.not(lessons:{result: nil})
    # making a new connection between categories and lessons and get gid of lessons that current_user has not taken yet.nil is default value of the result.
  end
end
