class Api::V1::RestaurantInterface::OrdersController < Api::V1::RestaurantInterface::BaseController
	

    def index
        @restaurant_id = User.find(params[:user_id]).restaurant_owners.first.restaurant.id
        @orders = OrderRestaurant.where(restaurant_id: @restaurant_id).order('created_at DESC')
        render json: @orders,
           each_serializer: Api::V1::RestaurantInterface::OrdersRestaurantSerializer
        
    end

    def show
        @restaurant_id = current_user.restaurant_owners.first.restaurant.id

        @order = Order.find(params[:id])
        @order_items = @order.order_items.where(restaurant_id: @restaurant_id)
    end
end
