class AddDeviceIdToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :device_id, :integer
  end

	def self.down
    remove_column :logs, :device_id
  end

end