class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :title
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end
