class OrderAddress < ActiveRecord::Base
    belongs_to :order
    belongs_to :address
end
