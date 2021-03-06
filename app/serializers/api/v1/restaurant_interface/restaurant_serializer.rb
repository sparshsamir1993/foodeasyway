class Api::V1::RestaurantInterface::RestaurantSerializer < ActiveModel::Serializer
    attributes :id,:name, :contact, :avatar, :min_order, :restaurant_owner
    has_many :items, dependent: :destroy
    has_many :order_items
    belongs_to :order_restaurants
    has_many :orders, through: :order_restaurants
    has_many :delivery_locations
    has_one :restaurant_owner
  
    def created_at
     object.created_at.in_time_zone.iso8601 if object.created_at
    end
  
    def updated_at
     object.updated_at.in_time_zone.iso8601 if object.created_at
    end
  
end