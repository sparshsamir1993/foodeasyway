class DropTableUsers < ActiveRecord::Migration[5.0]
  def down
      drop_table :users
  end
end
