class RestaurantsController < ApplicationController
	before_action :authenticate_user!


	def index
		@restaurant = Restaurant.order("id ASC")
		@user = current_user
		@item =Item.last


	end
	def show
		@restaurant = Restaurant.find(params[:id])
		@items = @restaurant.items.all.paginate(page: params[:page], per_page: 40).searchname(params[:searchname])
		@user = current_user
		if params.has_key?(:template) && params[:template] == 'false'
			respond_to do |format|
				format.html { render partial: 'restauran' ,layout:false, status: :ok }
			end
		end
	end

	def new
	end
	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(restaurants_params)
			redirect_to admin_restaurant_path( :restaurant_id=>@restaurant.id)
		else

			render :action => 'edit'
		end
	end

	private
		def restaurants_params
			params.require(:restaurant).permit(:name, :contact, :avatar, :min_order)
		end

end
