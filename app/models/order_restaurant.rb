class OrderRestaurant < ActiveRecord::Base
    belongs_to :order
    belongs_to :restaurant
    has_many :order_items
    has_many :items ,through: :order_items
    def confirm
        self.status = 'confirmed'
        save!
        return true
    end

end