class Admin::UsersController < ApplicationController
    def index
        @users=User.paginate(page: params[:page], per_page: 10)
    end
    def update
        @user=User.find(params[:id])
        @user.update_attribute(:is_admin, true)
        redirect_to admin_users_path
    end
    def destroy
        @user=User.find(params[:id])
        @user.update_attribute(:is_admin, false)
        redirect_to admin_users_path
    end
end
