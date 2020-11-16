class CreateWorktimes < ActiveRecord::Migration[6.0]
  def change
    create_table :worktimes do |t|
      t.datetime :ontime
      t.datetime :offtime

      t.timestamps
    end
  end
end
