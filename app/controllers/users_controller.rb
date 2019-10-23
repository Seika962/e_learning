class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @activities = Activity.where(user: @user)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new' 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page:6)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page:6)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
  end
end