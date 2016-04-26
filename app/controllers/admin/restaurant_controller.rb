class Admin::RestaurantController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	def index
	end
	def new
		@restaurant = Restaurant.new
	end

	def edit
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end
	private
		def restaurant_params
			params.permit(:name, :id, :contact)
		end
end

