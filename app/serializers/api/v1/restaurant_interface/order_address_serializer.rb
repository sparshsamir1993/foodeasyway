class Api::V1::RestaurantInterface::OrderAddressSerializer < ActiveModel::Serializer
    attribute :address
    belongs_to :order
    belongs_to :address
 
end