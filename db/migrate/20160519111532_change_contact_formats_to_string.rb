class ChangeContactFormatsToString < ActiveRecord::Migration
  def change
  	change_column :users, :contact,:string
  	change_column :restaurants, :contact,:string
  end
end
