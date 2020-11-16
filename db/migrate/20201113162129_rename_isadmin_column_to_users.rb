class RenameIsadminColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :isadmin, :admin
  end
end
