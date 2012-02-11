class CreateLocationStatuses < ActiveRecord::Migration
  def change
    create_table :location_statuses do |t|
    	t.integer :location_id
    	t.integer :status_id
    
      t.timestamps
    end
  end
end
