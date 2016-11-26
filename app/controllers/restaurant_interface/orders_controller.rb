class RestaurantInterface::OrdersController < ApplicationController

    layout 'restaurant_sidenav'

    def index
        @restaurant_id = current_user.restaurant_owners.first.restaurant.id
        @orders = Restaurant.find(@restaurant_id).orders
    end

    def show
        @restaurant_id = current_user.restaurant_owners.first.restaurant.id

        @order = Order.find(params[:id])
        @order_items = @order.order_items.where(restaurant_id: @restaurant_id)
    end
end
