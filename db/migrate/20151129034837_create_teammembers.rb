class CreateTeammembers < ActiveRecord::Migration
  def change
    create_table :teammembers do |t|
      t.string :name
      t.string :display_name

      t.timestamps null: false
    end
  end
end
