class Item < ActiveRecord::Base
	belongs_to :restaurant
	has_many :order_items
	enum item_type: {
    "Soup": 0,
		"Starters": 1,
		"Breads":2,
		"Rice or Biriyani":3,
		"Main course": 4,
		"Dessert": 5,
  }
	has_many :orders, through: :order_items
	validates :name,  :presence => true
	validates :price, :presence => true

	scope :search, lambda { |query|
	   return nil  if query.blank?
	 terms = query.downcase.split(/\s+/)

	 terms = terms.map { |e|
	   (e.gsub('*', '%').prepend('%') + '%').gsub(/%+/, '%')
	 }
	 num_or_conds = 1
	 where(
	   terms.map { |term|
		 "(LOWER(items.name) LIKE ?)"
	   }.join(' AND '),
	   *terms.map { |e| [e] * num_or_conds }.flatten
	 )
	}

end
