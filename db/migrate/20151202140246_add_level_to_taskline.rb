class AddLevelToTaskline < ActiveRecord::Migration
  def change
    add_column :tasklines, :level, :integer
  end
end
