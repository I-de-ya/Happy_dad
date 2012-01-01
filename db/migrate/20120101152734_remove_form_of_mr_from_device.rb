class RemoveFormOfMrFromDevice < ActiveRecord::Migration
  def up
    remove_column :devices, :form_of_mr
  end

  def down
    add_column :devices, :form_of_mr, :boolean
  end
end
