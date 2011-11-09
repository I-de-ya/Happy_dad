class AddLocAndStatToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :status_id, :integer
    add_column :devices, :location_id, :integer
  end
end
