class RestaurantOwner < ActiveRecord::Base
    belongs_to :user
    belongs_to :restaurant
end
