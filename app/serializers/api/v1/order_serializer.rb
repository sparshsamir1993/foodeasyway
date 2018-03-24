class Api::V1::OrderSerializer < ActiveModel::Serializer
    attributes :id, :order_address, :order_items, :order_address, :order_restaurants
    belongs_to :user
	has_many :order_restaurants
	belongs_to :restaurant
	has_one :order_address
	has_many :order_items
	has_many :items, through: :order_items
    def total_bill
    end

    def confirmed
    	self.status = 'confirmed'
    	save!
    	return true
    end

end
