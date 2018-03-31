class Api::V1::RestaurantInterface::UserSerializer < ActiveModel::Serializer
    has_many :orders
    has_many :restaurant_owners
    has_many :address
    attributes :id,:name, :email, :authentication_token, :address, :contact, :client, :'access-token', :addresses, :orders, :restaurant_owners
    def created_at
     object.created_at.in_time_zone.iso8601 if object.created_at
    end

    def updated_at
     object.updated_at.in_time_zone.iso8601 if object.created_at
    end
end
