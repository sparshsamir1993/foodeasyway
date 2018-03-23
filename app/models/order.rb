class Order < ActiveRecord::Base
	belongs_to :user
	serialize :order, Hash
	has_many :order_restaurants, dependent: :destroy
	belongs_to :restaurant
	has_many :order_items, dependent: :destroy
	has_one :order_address
	has_one :address
	has_many :items, through: :order_items
	scope :this_month_order_details, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
	def total_bill
	end

	def confirmed
		self.status = 'confirmed'
		save!
		return true
	end
end
