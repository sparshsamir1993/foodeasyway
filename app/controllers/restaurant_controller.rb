class RestaurantController < ApplicationController
	before_action :authenticate_user!


	def index
		@restaurant = Restaurant.order("id ASC")
		@user = current_user
		@item =Item.last


	end
	def show
		@restaurant = Restaurant.find(params[:user_id])
		@items = @restaurant.items.all.search(params[:search]).paginate(page: params[:page], per_page: 40)
		@user = current_user
		@restaurant_user = @restaurant.users.new
		@restaurant_user = @user
		items = Item.search(params[:search])
	end

	def new
	end


end
