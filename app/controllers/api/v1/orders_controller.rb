class Api::V1::OrdersController < Api::V1::BaseController
    def index
        orders = Order.all
        render json: orders,
            each_serializer: Api::V1::OrderSerializer

    end
end
