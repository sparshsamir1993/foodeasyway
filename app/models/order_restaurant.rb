class OrderRestaurant < ActiveRecord::Base
    belongs_to :order
    belongs_to :restaurant
    belongs_to :user
    has_many :order_items
    has_many :items ,through: :order_items
    def confirm_user
        self.update(has_user_confirmed: true)
        return true
    end

end
