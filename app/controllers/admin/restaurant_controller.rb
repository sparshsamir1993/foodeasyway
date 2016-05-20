class Admin::RestaurantController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	def index
		@restaurant = Restaurant.all
	end

	def new 
		@restaurant = Restaurant.new
	end

	def edit
	end

	def show
		@item =Restaurant.find(params[:id]).items
		@restaurant = Restaurant.find(params[:id])
		@orders = @restaurant.orders.all
		#@item = Item.last
	end

	

	def new_item
		@restaurant = Restaurant.find(params[:id])
		@item = Item.new(items_params)
		@item.restaurant_id = @restaurant.id
		
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to admin_restaurant_path(@restaurant)
		else
			render('new')
		end
		
	end

	def create_item
		@restaurant = Restaurant.find(params[:id])
		@item = @restaurant.items.new
		if @item.save    
			 
			redirect_to admin_restaurant_path(@item)

		else
			render('new')
		end
		
	end
	def destroy
		Restaurant.find(params[:id]).destroy
    	redirect_to :action=>"index", :controller=>"admin/restaurant"
    end
	

	private
		def restaurant_params
			params.permit(:name, :contact)
		end

		def items_params
			params.permit(:name, :price, :quantity)
		end
end

