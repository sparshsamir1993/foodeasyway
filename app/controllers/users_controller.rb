class UsersController < ApplicationController
	before_action :authenticate_user!
	skip_before_filter :verify_authenticity_token
	def show

	end
	def edit
	end
	def update
		@user = current_user

		@restaurant =  Restaurant.find(params[:user][:restaurant_id])
		if @user.update_attributes(user_params)
			redirect_to user_order_index_path(:restaurant_id => @restaurant.id, :user_id=>current_user.id)
		else
			render('new')
		end
	end

    def destroy
		current_user.destroy
    	redirect_to root_path
    end

    private
    def user_params
    	params.require(:user).permit(:email, :contact, :address, :restaurant_id, :_method, :utf8, :authenticity_token, :commit, :id)
    end
end
