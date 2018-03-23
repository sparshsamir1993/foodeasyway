class Api::V1::OrderRestaurantSerializer < ActiveModel::Serializer
    attributes :restaurant_id, :order_id, :has_user_confirmed, :grand_total, :user_id, :grand_total, :status, :id, :order, :restaurant, :order_items
    belongs_to :order
    belongs_to :restaurant
    belongs_to :user
    has_many :order_items
    has_many :items ,through: :order_items
    
end