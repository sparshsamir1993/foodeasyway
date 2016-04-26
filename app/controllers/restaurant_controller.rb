class RestaurantController < ApplicationController
	before_action :authenticate_user!
	def index
		@restaurant = Restaurant.order("id ASC")
		@item =Item.last
	end
	def show
		@restaurant = Restaurant.find(params[:id])
	     
	end
	def new
	end

end
