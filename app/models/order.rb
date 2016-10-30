class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	serialize :order, Hash
	has_many :orders
	has_many :order_items
	scope :this_month_order_details, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
	def total_bill
	end
end
