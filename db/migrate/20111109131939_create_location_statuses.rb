class CreateLocationStatuses < ActiveRecord::Migration
  def change
    create_table :location_statuses do |t|

      t.timestamps
    end
  end
end
