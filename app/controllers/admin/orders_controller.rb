class Admin::OrdersController < OrdersController
    before_action :require_admin
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_grouped = @order.order_items.group_by(&:restaurant_id)
    end
end
