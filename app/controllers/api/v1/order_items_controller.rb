class Api::V1::OrderItemsController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token
    def index
        @items = Order.find(params[:order_id]).order_items
        render json: @items,
            each_serializer: Api::V1::OrderItemsSerializer

    end
    def create
        @items = Order.find(params[:order_id]).order_items
        @restaurant = Restaurant.find(params[:restaurant_id])
        if params[:order_id].present?
            order = OrderItem.update_order(params[:order_id],params[:item_id], params[:quantity], params[:restaurant_id], params[:user_id])
            #@cart_item = CartItem.new(cart_item_params)
            if order
                # if order.order_restaurants.group_by(&:restaurant_id).keys.include?(params[:restaurant_id].to_i)
                #     order.order_restaurants.where(restaurant_id: params[:restaurant_id]).first.update(order_id: params[:order_id])
                # else
                #     order.order_restaurants.create(restaurant_id: params[:restaurant_id],order_id: params[:order_id], order_item_id: order.order_items.last.id)
                # end

                render(json: Api::V1::OrderItemsSerializer.new(order).to_json)
            else
                respond_to do |format|
                    format.html { render :new }
                    format.json { render json: 'error', status: :unprocessable_entity }
                end
            end
        else
            order = OrderItem.create_order(params[:item_id], params[:quantity], params[:restaurant_id], params[:user_id])

            if order
                params[:order_id] = order.id
                render(json: Api::V1::OrderItemsSerializer.new(order).to_json)

            else
                respond_to do |format|
                    format.html { render :new }
                    format.json { render json: 'error', status: :unprocessable_entity }
                end
            end
        end

    end
end
