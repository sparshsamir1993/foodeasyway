class Order < ActiveRecord::Base
	belongs_to :user , foreign_key: 'user_id'
	belongs_to :restaurant, foreign_key: 'restaurant_id'
	serialize :order, Hash

end
