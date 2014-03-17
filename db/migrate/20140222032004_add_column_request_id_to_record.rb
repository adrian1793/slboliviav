class AddColumnRequestIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :request_id, :integer
  end
end
