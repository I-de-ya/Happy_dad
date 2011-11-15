class CreateReplacementPairs < ActiveRecord::Migration
  def change
    create_table :replacement_pairs do |t|
      t.integer :device_id
      t.integer :replacement_id

      t.timestamps
    end
  end
end
