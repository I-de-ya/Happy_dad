class AddStatusIdAndLocationIdToLocationStatus < ActiveRecord::Migration
  def change
    add_column :location_statuses, :location_id, :integer
    add_column :location_statuses, :status_id, :integer
  end
end
