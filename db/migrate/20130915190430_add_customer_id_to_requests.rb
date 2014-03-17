class AddCustomerIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :customer_id, :integer
  end
end
