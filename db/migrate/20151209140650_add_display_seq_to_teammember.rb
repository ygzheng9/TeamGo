class AddDisplaySeqToTeammember < ActiveRecord::Migration
  def change
    add_column :teammembers, :display_seq, :integer
  end
end
