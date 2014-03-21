class ChangeColumnsToCustomer < ActiveRecord::Migration
  def up
    remove_column :customers, :city_id
    add_column :customers, :city_id, :integer, null: false
    remove_column :customers, :department
  end
  def down
    remove_column :customers, :city_id
    add_column :customers, :city_id, :string
    add_column :customers, :department, :string
  end
end
