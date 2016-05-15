class Item < ActiveRecord::Base
	belongs_to :restaurant
	
	validates :name,  :presence => true
  	validates :price, :presence => true
end
