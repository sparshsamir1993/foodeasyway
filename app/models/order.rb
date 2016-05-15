class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant, foreign_key: 'restaurant_id'
	serialize :order, Hash

end
