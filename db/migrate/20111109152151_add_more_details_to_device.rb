class AddMoreDetailsToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :uniq_number_in_ASOMI, :integer
    add_column :devices, :device_type, :string
    add_column :devices, :inventory_number, :integer
    add_column :devices, :serial_number, :integer
    add_column :devices, :mr_unit, :string
    add_column :devices, :next_mr_date, :date
    add_column :devices, :prev_mr_date, :date
    add_column :devices, :replace_param, :integer
    add_column :devices, :form_of_mr, :string
    add_column :devices, :input_range, :string
    add_column :devices, :input_measurement_units, :string
    add_column :devices, :output_range, :string
    add_column :devices, :output_measurement_units, :string
    add_column :devices, :model, :string
    add_column :devices, :year_of_production, :date
    add_column :devices, :beginning_operation_year, :date
    add_column :devices, :changeover_input_range, :string
    add_column :devices, :changeover_input_measurement_units, :string
    add_column :devices, :passport, :string
    add_column :devices, :passport_store_place, :string
    add_column :devices, :passport_electronic_version, :string
    add_column :devices, :tech_description, :string
    add_column :devices, :tech_description_store_place, :string
    add_column :devices, :tech_description_electronic_version, :string
    add_column :devices, :user_manual, :string
    add_column :devices, :user_manual_store_place, :string
    add_column :devices, :user_manual_electronic_version, :string
    add_column :devices, :gold, :float
    add_column :devices, :silver, :float
    add_column :devices, :platinum, :float
    add_column :devices, :PG_metals, :float
    add_column :devices, :subreport_number, :string
    add_column :devices, :ENS_number, :string
    add_column :devices, :comment, :string
 end
end
