class AddColumnsToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :old_value, :string
    add_column :logs, :new_value, :string
    add_column :logs, :attr, :string
  end

	def self.down
    remove_column :logs, :old_value
		remove_column :logs, :new_value
		remove_column :logs, :attr
	end

end
