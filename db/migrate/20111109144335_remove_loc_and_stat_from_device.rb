class RemoveLocAndStatFromDevice < ActiveRecord::Migration
  def up
    remove_column :devices, :status
    remove_column :devices, :location
  end

  def down
    add_column :devices, :location, :string
    add_column :devices, :status, :string
  end
end
