class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :house_number
      t.string :map_address
      t.string :city
      t.timestamps null: false
    end
  end
end
