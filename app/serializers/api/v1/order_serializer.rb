class Api::V1::OrderSerializer < ActiveModel::Serializer
    attributes :id
    belongs_to :user
	has_many :order_restaurants
	belongs_to :restaurant
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
