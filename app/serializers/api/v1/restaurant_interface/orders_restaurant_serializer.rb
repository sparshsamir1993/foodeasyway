class Api::V1::RestaurantInterface::OrdersRestaurantSerializer < ActiveModel::Serializer
    belongs_to :order
    belongs_to :restaurant
    belongs_to :user
    has_many :order_items
    has_many :items ,through: :order_items
    attributes :restaurant, :order_items,:restaurant_id, :order_id, :has_user_confirmed, :grand_total, :user_id, :grand_total, :status, :id, :order
    def confirm_user
        self.update(has_user_confirmed: true)
        return true
    end


end
