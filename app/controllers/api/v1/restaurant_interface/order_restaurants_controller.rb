class Api::V1::RestaurantInterface::OrderRestaurantsController < Api::V1::BaseController
	def index
	
	end
	def change_order_status
		order_restaurant_id = params[:id]
		status = params[:status]
		@order_restaurant = OrderRestaurant.find(order_restaurant_id)
		@order_restaurant.status = status
		if @order_restaurant.save!
			render(json: Api::V1::OrderRestaurantSerializer.new(@order_restaurant).to_json)
		end
	end

end
