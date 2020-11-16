class Users < ActiveRecord::Migration[6.0]
  def change
     add_column :users, :isadmin, :boolean
     add_column :users, :password_digest, :string
  end
end
