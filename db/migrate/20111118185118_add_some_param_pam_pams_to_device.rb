class AddSomeParamPamPamsToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :position, :string
    add_column :devices, :input_range, :string
    add_column :devices, :input_measurement_units, :string
    add_column :devices, :output_range, :string
    add_column :devices, :output_measurement_units, :string
    add_column :devices, :model, :string
    add_column :devices, :function, :string
    add_column :devices, :project_specification, :string
  end
end
