class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string       :name
      t.text         :text
      t.date         :limit
      t.text         :status
      t.integer      :level
      t.integer      :priority
      t.timestamps
    end
  end
end
