class RemovePositionParamsFromDevice < ActiveRecord::Migration
  def up
    remove_column :devices, :site
    remove_column :devices, :tech_unit
    remove_column :devices, :position
    remove_column :devices, :function
    remove_column :devices, :project_specification
  end

  def down
    add_column :devices, :project_specification, :string
    add_column :devices, :function, :string
    add_column :devices, :position, :string
    add_column :devices, :tech_unit, :string
    add_column :devices, :site, :string
  end
end
