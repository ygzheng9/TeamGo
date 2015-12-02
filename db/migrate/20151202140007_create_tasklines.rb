class CreateTasklines < ActiveRecord::Migration
  def change
    create_table :tasklines do |t|
      t.integer :project_id
      t.string :code
      t.string :name
      t.string :display_seq
      t.string :desc
      t.integer :teammember_id
      t.integer :uplevel_id
      t.date :planned_start_dt
      t.date :planned_end_dt
      t.date :actual_start_dt
      t.date :actual_end_dt
      t.decimal :planned_manhours
      t.decimal :actual_manhours
      t.decimal :completion

      t.timestamps null: false
    end
  end
end
