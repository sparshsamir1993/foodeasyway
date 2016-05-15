class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant, foreign_key: 'restaurant_id'
	has_many :items
	serialize :order, Hash

end
