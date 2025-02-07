class AddHighPriorityToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :high_priority, :boolean
  end
end
