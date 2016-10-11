class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	serialize :order, Hash
	has_many :orders
	has_many :order_items

	def total_bill
	end
end
