class UsersController < ApplicationController
	before_action :authenticate_user!
	skip_before_filter :verify_authenticity_token  
	def index
	end
	def create
		@user = current_user
		@restaurant =  Restaurant.find(params[:restaurant_id])
		if @user.save
			redirect_to :controller=>'order', :action => :index, :restaurant_id => @restaurant.id
		else
			render('new')
		end
	end
	def update
		@user = current_user
		
		if @user.update_attributes(user_params)
			@restaurant = @user.restaurant_id
      		redirect_to user_order_index_path(:user_id=>@user, :restaurant_id=>@restaurant)
   		else
      		@subjects = User.all
      		render :action => 'edit'
        end
        
    end
    def show
    	@user = User.all
    end
    def user_params
   		params.require(:user).permit(:contact, :address, :restaurant_id)
	end
end
