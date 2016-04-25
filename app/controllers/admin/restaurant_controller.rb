class Admin::RestaurantController < ApplicationController
	def index
	end
	def new
		@restaurant = Restaurant.new
	end

	def edit
	end

	def show
	end

	def create
    @restaurant = Restaurant.new(retaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to admin_restaurant_path }
        format.json { render :show }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors}
      end
    end
  end
end

