class RenameCityToCustomer < ActiveRecord::Migration
  def change
    rename_column :customers, :city, :city_id
  end
end
