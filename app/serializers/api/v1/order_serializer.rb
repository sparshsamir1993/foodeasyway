class Api::V1::OrderSerializer < ActiveModel::Serializer

    belongs_to :user
	has_many :order_restaurants
	has_many :restaurants, through: :order_restaurants
	has_one :order_address
	has_many :order_items
	has_many :items, through: :order_items
	attributes :id, :order_address, :order_items, :order_address, :order_restaurants
    def total_bill
    end

    def confirmed
    	self.status = 'confirmed'
    	save!
    	return true
    end

end
