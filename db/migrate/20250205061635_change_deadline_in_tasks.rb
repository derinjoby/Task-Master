class ChangeDeadlineInTasks < ActiveRecord::Migration[8.0]
  def change
    change_column :tasks, :deadline, :date
  end
end
