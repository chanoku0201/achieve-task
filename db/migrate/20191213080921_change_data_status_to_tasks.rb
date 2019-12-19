class ChangeDataStatusToTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :status, :integer
    change_column_default :tasks, :status, from: 'START', to: 0
  end
end
