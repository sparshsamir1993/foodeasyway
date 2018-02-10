class RenameAccessTokenInUsersAddClient < ActiveRecord::Migration
  def change
    add_column :users, :client, :string
    rename_column :users, :'access_token', :'access-token'
  end
end
