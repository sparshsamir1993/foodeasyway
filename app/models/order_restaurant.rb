class OrderRestaurant < ActiveRecord::Base
    belongs_to :order
    belongs_to :restaurant
    belongs_to :user
    has_many :order_items
    has_many :items ,through: :order_items
    enum status: {
        "order_sent": 0,
		"accepted": 1,
		"in_kitchen":2,
		"on_the_way":3
  }
    def confirm_user
        self.update(has_user_confirmed: true)
        return true
    end

end
