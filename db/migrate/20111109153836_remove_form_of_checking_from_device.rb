class RemoveFormOfCheckingFromDevice < ActiveRecord::Migration
  def up
    remove_column :devices, :form_of_checking
  end

  def down
    add_column :devices, :form_of_checking, :boolean
  end
end
