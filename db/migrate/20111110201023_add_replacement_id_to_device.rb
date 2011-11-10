class AddReplacementIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :replacement_id, :integer
  end
end
