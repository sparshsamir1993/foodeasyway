class RestaurantController < ApplicationController
	before_action :authenticate_user!
	
	
	def index
		@restaurant = Restaurant.order("id ASC")
		@user = current_user
		@item =Item.last
		
		
	end
	def show
		@restaurant = Restaurant.find(params[:id])
	    @item = Item.last
	    
	    @user = current_user
	    @restaurant_user = @restaurant.users.new
	    @restaurant_user = @user
	end
	def new
	end
	

end
