class ChangeColumnsToCustomer < ActiveRecord::Migration
  def change
    change_column :customers, :city_id, :integer
    remove_column :customers, :department
  end

end
