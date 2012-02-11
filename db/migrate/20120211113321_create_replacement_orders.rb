class CreateReplacementOrders < ActiveRecord::Migration
  def change
    create_table :replacement_orders do |t|
      t.string :title

      t.timestamps
    end
  end
end
