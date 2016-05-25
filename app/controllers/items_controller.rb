class ItemsController < ApplicationController
  def index
  		@restaurant = Restaurant.find(params[:restaurant_id])
	    @items = @restaurant.items.search(params[:search]).paginate(page: params[:page], per_page: 60)
	    
	    @user = current_user
	    @restaurant_user = @restaurant.users.new
	    @restaurant_user = @user
  end
end
