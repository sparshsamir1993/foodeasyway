class Api::V1::OrderItemsSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :order_restaurant
  belongs_to :restaurant

end
