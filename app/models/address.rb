class Address < ActiveRecord::Base

    belongs_to :user
    belongs_to :order
    has_many :order_addresses
    
end
