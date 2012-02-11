class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :title
      t.integer :location_id
      t.integer :status_id

      t.timestamps
    end
  end
end
