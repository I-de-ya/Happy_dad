class AddAwsomeToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :comment, :string
    add_column :devices, :form_of_mr, :string
  end
end
