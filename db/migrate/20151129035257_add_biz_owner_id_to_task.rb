class AddBizOwnerIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :biz_owner_id, :integer
  end
end
