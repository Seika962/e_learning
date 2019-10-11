class Admin::StaticPagesController < ApplicationController
    def admin_page
        @user=User.find(params[:id])
    end
end
