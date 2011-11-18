class AddPararamsToDevices < ActiveRecord::Migration
  def change
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
  end
end
