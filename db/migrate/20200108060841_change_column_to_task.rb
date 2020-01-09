class ChangeColumnToTask < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :user_id, :integer, null: false
  end
end
