class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|

      t.timestamps null: false
    end
  end
end
