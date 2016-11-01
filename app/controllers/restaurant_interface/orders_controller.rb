class RestaurantInterface::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end
end
