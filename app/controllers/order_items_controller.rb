class OrderItemsController < ApplicationController

    def create
        @items = Restaurant.find(params[:restaurant_id]).items
        @restaurant = Restaurant.find(params[:restaurant_id])
        if session[:order_id].present?
            order = OrderItem.update_order(session[:order_id],params[:item_id], params[:quantity], params[:restaurant_id], params[:user_id], params[:order_restaurant_id])
            #@cart_item = CartItem.new(cart_item_params)
            if order
                if order.order_restaurants.group_by(&:restaurant_id).keys.include?(params[:restaurant_id].to_i)
                    order.order_restaurants.where(restaurant_id: params[:restaurant_id]).first.update(order_id: session[:order_id])
                else
                    order.order_restaurants.create(restaurant_id: params[:restaurant_id],order_id: session[:order_id], order_item_id: order.order_items.last.id)
                end
                respond_to do |format|
    		        if params.has_key?(:template)
    		            if params[:template] == 'false'
    		                format.html {render partial: 'restaurants/table.html', locals: {users: @items}}
    		            else
    		                format.html
    		            end
    		        else
    		            format.html
    		        end
    		        format.html
    		        format.json {render json: @items}
    		    end
            else
                respond_to do |format|
                    format.html { render :new }
                    format.json { render json: 'error', status: :unprocessable_entity }
                end
            end
        else
            order = OrderItem.create_order(params[:item_id], params[:quantity], params[:restaurant_id], params[:user_id], params[:order_restaurant_id])

            if order
                session[:order_id] = order.id

                respond_to do |format|
    		        if params.has_key?(:template)
    		            if params[:template] == 'false'
    		                format.html {render partial: 'restaurants/table.html', locals: {users: @items}}
    		            else
    		                format.html
    		            end
    		        else
    		            format.html
    		        end
    		        format.html
    		        format.json {render json: @items}
    		    end
            else
                respond_to do |format|
                    format.html { render :new }
                    format.json { render json: 'error', status: :unprocessable_entity }
                end
            end
        end
    end

    def update
        @order = Order.find(session[:order_id]).order_items.find(params[:id])
        #@cart_item = CartItem.new(cart_item_params)
        if @order
            params[:order_item][:total] = @order.item.price * params[:order_item][:quantity].to_i
            respond_to do |format|
                if @order.update(order_item_params)
                    format.html { redirect_to order_path(session[:order_id]) }
                    format.json { render json: order.id.to_s, status: :created}
                end
            end
        else
            respond_to do |format|
                format.html { render :new }
                format.json { render json: 'error', status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @order = Order.find(session[:order_id]).order_items.find(params[:id])
        if @order.destroy
          flash[:notice] = "Successfully deleted item."
          redirect_to order_path(:id => session[:order_id])
        end
    end
    private
        def order_item_params
            params.require(:order_item).permit(:item_id, :quantity, :restaurant_id, :user_id, :order_id, :total, :order_restaurant_id)
        end
end
