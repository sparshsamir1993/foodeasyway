class Api::V1::OrderRestaurantsController <  Api::V1::BaseController

    def show
        @order_restaurant = OrderRestaurant.find(params[:id])
        render(json: Api::V1::OrderRestaurantSerializer.new(@order_restaurant).to_json)
    end
    def user_order_confirm
        @order = Order.find(params[:order_id])
        @order_restaurant = OrderRestaurant.find(params[:order_restaurant_id])
        grand_total = params[:grand_total]
        if(grand_total)
            @order_restaurant.update(grand_total:  grand_total)
            @order_restaurant.update(status: OrderRestaurant.statuses[:order_sent])
        end
        

        if @order_restaurant.confirm_user()
            render json: @order_restaurant,
                each_serializer: Api::V1::OrderRestaurantSerializer
        end
    end
end