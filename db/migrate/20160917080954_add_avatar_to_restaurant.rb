class AddAvatarToRestaurant < ActiveRecord::Migration
    def up
      add_attachment :restaurants, :avatar
    end

    def down
      remove_attachment :restaurants, :avatar
    end
end
