class CreateAutoPositions < ActiveRecord::Migration
  def change
    create_table :auto_positions do |t|
      t.string :title
      t.integer :channel_id
      t.string :project_specification
      t.string :technological_unit
      t.string :automation_area
      t.string :function
      t.string :parameter_name
      t.string :parameter_range
      t.string :parameter_measurement_units

      t.timestamps
    end
  end
end
