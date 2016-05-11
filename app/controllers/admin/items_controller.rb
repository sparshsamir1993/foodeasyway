class Admin::ItemsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	def index
		@item =Item.order("id ASC")
		#@this_item = @item.find(params[:id])
	end
	def new
		@restaurant = Restaurant.find(params[:id])
		@item = @restaurant.items.new
		@item.restaurant_id = @restaurant.id
		@item.save
	end

	def edit
	end

	def show
		@item = Item.last
	end

	def create
		@restaurant = Restaurant.find(params[:id])
		@item = Item.new(item_params)
		@item.restaurant_id = @restaurant.id
		if @item.save
			redirect_to :action=>"show", :controller=>"admin/restaurant", :id=>@restaurant.id
		else
			render('new')
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@item = @restaurant.items.find(params[:item_id])
		@item.destroy
    	redirect_to :action=>"index", :controller=>"admin/restaurant"
    end

	private
		def item_params
			if :action =='new'
				params.permit(:name, :quantity, :price, :id,:item)
			end 
			params.require(:item).permit(:name, :price, :quantity, pets_attributes: [:id])
		end
end
