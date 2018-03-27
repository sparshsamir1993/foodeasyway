class Api::V1::OrderAddressSerializer < ActiveModel::Serializer
    attribute :address
    belongs_to :order
    belongs_to :address
 
end