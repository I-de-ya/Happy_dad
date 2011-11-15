class AddFormOfMrToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :form_of_mr, :boolean
  end
end
