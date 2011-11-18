class RemoveSomeFromDevice < ActiveRecord::Migration
  def up
    remove_column :devices, :uniq_number
  end

  def down
    add_column :devices, :uniq_number, :integer
  end
end
