class RestaurantsController < ApplicationController


	def index
		@restaurants = Restaurant.order("id ASC")
		@user = current_user
		@usr1=@user
	end

	def show

		@restaurant = Restaurant.find(params[:id])
		# @items = @restaurant.items.group_by(&:item_type).paginate(page: params[:page], per_page: 40).search(params[:search])
		@items = @restaurant.items.group_by(&:item_type)
		respond_to do |format|
			if params.has_key?(:template)
				if params[:template] == 'false'
					format.html {render partial: 'table.html', locals: {users: @items}}
				else
					format.html
				end
			else
				format.html
			end
			format.html
			format.json {render json: @items}
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
