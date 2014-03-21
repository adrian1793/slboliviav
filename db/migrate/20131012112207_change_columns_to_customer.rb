class ChangeColumnsToCustomer < ActiveRecord::Migration
  def up
    change_column :customers, :city_id, :integer
    remove_column :customers, :department
  end
  def down
    change_column :customers, :city_id, :string
    add_column :customers, :department, :string
  end
end
