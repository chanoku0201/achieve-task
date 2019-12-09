class RenameLimitColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :limit, :limit_date
  end
end
