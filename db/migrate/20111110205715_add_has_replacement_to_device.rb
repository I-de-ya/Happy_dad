class AddHasReplacementToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :has_replacement, :boolean
  end
end
