class Api::V1::RestaurantInterface::OrdersRestaurantSerializer < ActiveModel::Serializer
    belongs_to :order
    belongs_to :restaurant
    belongs_to :user
    has_many :order_items
    has_many :items ,through: :order_items
    attributes :id, :status, :has_user_confirmed, :order_id, :restaurant_id, :order_items
    def confirm_user
        self.update(has_user_confirmed: true)
        return true
    end


end
