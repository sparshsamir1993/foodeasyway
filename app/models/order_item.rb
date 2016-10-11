class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :item
    belongs_to :restaurant
    # def total_price_cents
    #     @total =  self.item.price * self.quantity
    #
    # end

    private
        def self.create_order(item_id, quantity, restaurant_id, user_id)

            if order = Order.create(restaurant_id: restaurant_id, user_id: user_id)
                @total = quantity.to_i * Item.find(item_id).price
                if order.order_items.create(item_id: item_id, quantity: quantity, restaurant_id: restaurant_id, total: @total)
                    return order
                else
                    return false
                end
            else
                return false
            end
        end

        def self.update_order(order_id, item_id, quantity, restaurant_id, user_id)
            order = Order.find(order_id)
            @total = quantity.to_i * Item.find(item_id).price
            if order.order_items.create(item_id: item_id, quantity: quantity, restaurant_id: restaurant_id, total: @total)
                return order
            else
                return false
            end
        end
end
