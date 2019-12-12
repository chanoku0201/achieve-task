class AddGenreidToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :genre_id, :integer
  end
end
