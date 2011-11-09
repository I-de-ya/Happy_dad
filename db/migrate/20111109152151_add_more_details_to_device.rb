class AddMoreDetailsToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :uniq_number, :integer
    add_column :devices, :device_type, :string
    add_column :devices, :form_of_checking, :boolean
    add_column :devices, :inventory_number, :integer
    add_column :devices, :serial_number, :integer
    add_column :devices, :mr_unit, :string
    add_column :devices, :next_mr_date, :date
    add_column :devices, :prev_mr_date, :date
    add_column :devices, :site, :string
    add_column :devices, :tech_unit, :string
    add_column :devices, :replace_param, :integer
  end
end
