class Admin::OrdersController < OrdersController

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_grouped = @order.order_items.group_by(&:restaurant_id)
    end
end
