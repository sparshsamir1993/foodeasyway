class RestaurantController < ApplicationController
	before_action :authenticate_user!
	def index
		@restaurant = Restaurant.order("id ASC")
		@item =Item.last
	end
	def show
		@restaurant = Restaurant.order("id ASC")
		@item =Item.order("id ASC")
	      
	    
	end
end
