class Restaurant < ActiveRecord::Base
	attr_accessor :current_user
	has_many :orders
	has_many :items, dependent: :destroy
	has_many :users
	has_many :order_items
	has_many :delivery_locations
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
