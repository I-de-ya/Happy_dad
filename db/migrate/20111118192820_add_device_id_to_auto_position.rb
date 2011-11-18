class AddDeviceIdToAutoPosition < ActiveRecord::Migration
  def change
    add_column :auto_positions, :device_id, :integer
  end
end
