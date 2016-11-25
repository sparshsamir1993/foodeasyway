class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :item
    belongs_to :order_restaurant
    belongs_to :restaurant
    # def total_price_cents
    #     @total =  self.item.price * self.quantity
    #
    # end

    private
        def self.create_order(item_id, quantity, restaurant_id, user_id, order_restaurant_id)

            if order = Order.create(restaurant_id: restaurant_id, user_id: user_id)
                @total = quantity.to_i * Item.find(item_id).price
                order.order_restaurants.create(restaurant_id: restaurant_id, order_id: order.id)
                if order.order_restaurants.find(order.order_restaurants.last.id).order_items.create(item_id: item_id, quantity: quantity, restaurant_id: restaurant_id, total: @total, order_id:  order.id,  order_restaurant_id: order_restaurant_id)
                    return order
                else
                    return false
                end
            else
                return false
            end
        end

        def self.update_order(order_id, item_id, quantity, restaurant_id, user_id, order_restaurant_id)
            order = Order.find(order_id)
            @total = quantity.to_i * Item.find(item_id).price
            if order.order_restaurants.where(restaurant_id: restaurant_id).first.present?
                if order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.group_by(&:item_id).keys.include?(item_id.to_i)
                    if order.order_restaurants.find(order.order_restaurants.where(restaurant_id: restaurant_id).first.id).order_items.where(item_id: item_id).first.update(quantity: quantity, restaurant_id: restaurant_id, order_id: order.id total: @total, order_restaurant_id: order_restaurant_id)
                        return order
                    else
                        return false
                    end
                else
                    if  order.order_items.create(item_id: item_id,quantity: quantity, restaurant_id: restaurant_id, total: @total, order_restaurant_id: order_restaurant_id)
                        return order
                    else
                        return false
                    end
                end
            else
                order.order_restaurants.create(restaurant_id: restaurant_id, order_id: session[:order_id])
                if order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.group_by(&:item_id).keys.include?(item_id.to_i)
                    if order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.where(item_id: item_id).first.update(quantity: quantity, restaurant_id: restaurant_id, total: @total, order_restaurant_id: order_restaurant_id)
                        return order
                    else
                        return false
                    end
                else
                    if  order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.create(item_id: item_id,quantity: quantity, restaurant_id: restaurant_id, total: @total, order_restaurant_id: order_restaurant_id)
                        return order
                    else
                        return false
                    end
                end
            end
        end
end
