class OrderItemsController < ApplicationController

    def create
        if session[:order_id].present?
            order = OrderItem.update_order(session[:order_id],params[:item_id], params[:quantity], params[:restaurant_id], params[:user_id])
            #@cart_item = CartItem.new(cart_item_params)
            if order
                respond_to do |format|
                    format.html { redirect_to order }
                    format.json { render json: order.id.to_s, status: :created}
                end
            else
                respond_to do |format|
                    format.html { render :new }
                    format.json { render json: 'error', status: :unprocessable_entity }
                end
            end
        else
            order = OrderItem.create_order(params[:item_id], params[:quantity], params[:restaurant_id], params[:user_id])

            if order
                session[:order_id] = order.id
                respond_to do |format|
                    format.html { redirect_to order }
                    format.json { render json: order.id.to_s, status: :created}
                end
            else
                respond_to do |format|
                    format.html { render :new }
                    format.json { render json: 'error', status: :unprocessable_entity }
                end
            end
        end
    end
end
