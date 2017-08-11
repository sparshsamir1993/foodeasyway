class Api::V1::OrderItemsSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :quantity, :order_id, :total, :name
  belongs_to :order_restaurant
  belongs_to :restaurant
  private
      def order_item_params
          params.require(:order_item).permit(:item_id, :quantity, :restaurant_id, :user_id, :order_id, :total, :order_restaurant_id, :name)
      end
end
