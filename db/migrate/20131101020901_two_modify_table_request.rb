class TwoModifyTableRequest < ActiveRecord::Migration
  def change
    change_column :requests, :case_about_id, :integer, null: false
    change_column :requests, :need_help_id, :integer, null: false

  end
end
