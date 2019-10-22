class StaticPagesController < ApplicationController
  def home
    if logged_in?
      render "users/dash_board"
    end
  end
end
