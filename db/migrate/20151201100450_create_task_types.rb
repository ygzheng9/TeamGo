class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.integer :company_id
      t.string :code
      t.string :name
      t.string :display_seq
      t.string :desc
      t.integer :teammember_id
      t.integer :uplevel_id

      t.timestamps null: false
    end
  end
end
