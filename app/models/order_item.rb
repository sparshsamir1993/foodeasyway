class OrderItem < ActiveRecord::Base
    belongs_to :item
    belongs_to :order_restaurant
    belongs_to :restaurant
    # def total_price_cents
    #     @total =  self.item.price * self.quantity
    #
    # end

    private
        def self.create_order(item_id, quantity, restaurant_id, user_id, name)

            if order = Order.create(restaurant_id: restaurant_id, user_id: user_id)
                @total = quantity.to_i * Item.find(item_id).price
                order.order_restaurants.create(restaurant_id: restaurant_id, order_id: order.id, user_id: user_id)
                if order.order_restaurants.last.order_items.create( item_id: item_id,
                                                                    quantity: quantity,
                                                                    restaurant_id: restaurant_id,
                                                                    total: @total,
                                                                    order_id:  order.id,
                                                                    order_restaurant_id: order.order_restaurants.last.id,
                                                                    name: name
                                                                    )
                    return order
                else
                    return false
                end
            else
                return false
            end
        end

        def self.update_order(order_id, item_id, quantity, restaurant_id, user_id, name)
            print 'updating'

            order = Order.find(order_id)
            @total = quantity.to_i * Item.find(item_id).price
            if order.order_restaurants.where(restaurant_id: restaurant_id).first.present?
                print 'updating rest'

                if order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.group_by(&:item_id).keys.include?(item_id.to_i)
                    print 'updating item'

                    if quantity.to_i > 0
                        if order.order_restaurants.find(order.order_restaurants.where(restaurant_id: restaurant_id).first.id).order_items.where(item_id: item_id).first.update(name: name, quantity: quantity, total: @total)
                            print order.order_items
                            return order
                        else
                            return false
                        end
                    else
                        order.order_restaurants.find(order.order_restaurants.where(restaurant_id: restaurant_id).first.id).order_items.where(item_id: item_id).first.destroy
                    end
                else
                    if  order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.create(  item_id: item_id,
                                                                                                                quantity: quantity,
                                                                                                                restaurant_id: restaurant_id,
                                                                                                                total: @total,
                                                                                                                order_restaurant_id: order.order_restaurants.where(restaurant_id: restaurant_id).first.id,
                                                                                                                order_id:  order.id,
                                                                                                                name: name
                                                                                                                )
                        return order
                    else
                        return false
                    end
                end
            else
                order.order_restaurants.create(restaurant_id: restaurant_id, order_id: order_id, user_id: user_id)
                if order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.group_by(&:item_id).keys.include?(item_id.to_i)
                    if quantity.to_i > 0
                        if order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.where(item_id: item_id).first.update(name: name, quantity: quantity, total: @total)
                            return order
                        else
                            return false
                        end
                    else
                        order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.where(item_id: item_id).first.destroy
                    end
                else
                
                    if  order.order_restaurants.where(restaurant_id: restaurant_id).first.order_items.create(item_id: item_id,quantity: quantity, restaurant_id: restaurant_id, total: @total, order_restaurant_id: order.order_restaurants.where(restaurant_id: restaurant_id).first.id, order_id:  order.id, name: name)
                        return order
                    else
                        return false
                    end

                end
            end
        end
end
