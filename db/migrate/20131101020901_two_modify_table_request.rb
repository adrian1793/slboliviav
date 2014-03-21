class TwoModifyTableRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :case_about_id
    remove_column :requests, :need_help_id

    add_column :requests, :case_about_id, :integer
    add_column :requests, :need_help_id, :integer

  end
end
