class Address < ActiveRecord::Base

    belongs_to :user
    has_many :order_addresses
    has_many :orders, through: :order_items
end
