class AddUseridToWorktimes < ActiveRecord::Migration[6.0]
  def change
    add_column :worktimes, :user_id, :int
  end
end
