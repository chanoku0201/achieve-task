class RemoveUseridToTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :user_id, :integer
  end
end
