class ChangeNotnullToTasks < ActiveRecord::Migration[5.0]
  def change
    change_column_null :tasks, :name, false
    change_column_null :tasks, :text, false
    change_column_null :tasks, :level, false
    change_column_null :tasks, :status, false
    change_column_null :tasks, :priority, false
    change_column_null :tasks, :genre_id, false
  end
end
