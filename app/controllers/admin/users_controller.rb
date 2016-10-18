class Admin::UsersController < ApplicationController
    before_action :require_admin
    def index
        @users  = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user =  User.find(params[:id])
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to admin_users_path, notice: 'Delivery location was successfully updated.' }
            format.json { render :show, status: :ok, location: admin_users_path }
          else
            format.html { render :edit }
            format.json { render json: admin_users_path.errors, status: :unprocessable_entity }
          end
        end
    end


    private

    def user_params
    	params.require(:user).permit(:email, :contact, :address, :restaurant_id, :_method, :utf8, :authenticity_token, :commit, :id, :admin)
    end
end
