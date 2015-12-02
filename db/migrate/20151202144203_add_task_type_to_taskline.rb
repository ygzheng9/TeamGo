class AddTaskTypeToTaskline < ActiveRecord::Migration
  def change
    add_column :tasklines, :task_type_id, :integer
  end
end
