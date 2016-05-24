class Restaurant < ActiveRecord::Base
	cattr_accessor :current_user
	has_many :orders
	has_many :items, dependent: :destroy
	has_many :users
	
end
