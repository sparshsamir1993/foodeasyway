class Item < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :order
	validates :name,  :presence => true
  	validates :price, :presence => true
end
