class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @static_pages = Activity.where("user_id = ? OR user_id IN (?)", current_user.id, current_user.following.ids).order(created_at: :desc).paginate(page:params[:page],per_page:8)
    # when you want to get one user by one id, you can say "user_id = ?", but when there are many user you want to get, you have to say "user_id IN (?)"
      render "users/dash_board"
    end
  end
end
