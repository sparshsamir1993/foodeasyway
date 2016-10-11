class Admin::RestaurantsController < RestaurantsController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	def index
		@restaurant = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
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
		@restaurant = Restaurant.new(restaurants_params)
		if @restaurant.save
			redirect_to admin_restaurants_path(@restaurant)
		else
			render('new')
		end

	end

	def create_item
		@restaurant = Restaurant.find(session[:id])
		@item = @restaurant.items.new
		if @item.save

			redirect_to admin_restaurant_path(@item)

		else
			render('new')
		end

	end
	def destroy
		Restaurant.find(params[:id]).destroy
    	redirect_to :action=>"index", :controller=>"admin/restaurants"
    end
	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(restaurants_params)
			redirect_to restaurant_path( :restaurant_id=>@restaurant.id)
		else

			render :action => 'edit'
	end

  end


	private
		def restaurants_params
			params.require(:restaurant).permit(:name, :contact, :avatar, :min_order)
		end

		def items_params
			params.permit(:name, :price, :quantity)
		end
end
