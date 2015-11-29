class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :biz_owner
      t.date :biz_plan_start_dt
      t.date :biz_plan_end_dt

      t.timestamps null: false
    end
  end
end
