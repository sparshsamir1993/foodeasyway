class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :item
    belongs_to :restaurant
    def total_price_cents
        return self.item.price * self.quantity
    end

    def get_product_preview
       return self.product.image
    end

    private
        def self.create_order(item_id, quantity, restaurant_id, user_id)
            if order = Order.create(restaurant_id: restaurant_id,user_id: user_id)
                if order.order_items.create(item_id: item_id, quantity: quantity, restaurant_id: restaurant_id)
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
            if order_item = order.order_items.find_by(item_id: item_id)
                order_item.quantity += 1
                if order_item.save
                    return order
                else
                    return false
                end
            elsif order.order_items.create(item_id: item_id, quantity: quantity, restaurant_id: restaurant_id)
                return order
            else
                return false
            end
        end
end
