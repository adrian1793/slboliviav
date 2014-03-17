class ModifyTableRequest < ActiveRecord::Migration
  def up
    rename_column :requests, :case_about, :case_about_id
    rename_column :requests, :need_help, :need_help_id

  end
  def down
    rename_column :requests, :case_about_id, :case_about
    rename_column :requests, :need_help_id, :need_help

  end
end
