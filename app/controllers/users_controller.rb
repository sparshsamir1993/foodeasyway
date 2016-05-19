class UsersController < ApplicationController
	before_action :authenticate_user!
	skip_before_filter :verify_authenticity_token  
	def index
	end
	def create
		@user = current_user
		@restaurant =  Restaurant.find(params[:restaurant_id])
		if @user.save
			redirect_to user_order_index_path(:restaurant_id => @restaurant.id, :user_id=>current_user.id)
		else
			render('new')
		end
	end
	
    def show
    	@user = User.all
    end
    def destroy
		current_user.destroy
    	redirect_to root_path
    end
    def user_params
   		params.require(:user).permit(:contact, :address, :restaurant_id)
	end
end
