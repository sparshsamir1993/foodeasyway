class Item < ActiveRecord::Base
	belongs_to :restaurant
	
	validates :name,  :presence => true
  	validates :price, :presence => true
  	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
