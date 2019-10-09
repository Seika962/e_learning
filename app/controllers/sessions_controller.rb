class SessionsController < ApplicationController
  def new
  end
  def create
    @user=User.find_by(email:params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success]="successfully logged in."

      redirect_to root_url
    else
      flash.now[:danger]="Invalid Credentials."
      render 'new'
    end
  end
end
