class AddSomeToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :uniq_number_in_ASOMI, :integer
  end
end
