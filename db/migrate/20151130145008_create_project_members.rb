class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table :project_members do |t|
      t.integer :project_id
      t.integer :teammember_id

      t.timestamps null: false
    end
  end
end
