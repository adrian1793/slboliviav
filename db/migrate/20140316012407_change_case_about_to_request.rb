class ChangeCaseAboutToRequest < ActiveRecord::Migration
  def change
    rename_column :requests, :case_about_id, :case_about
    change_column :requests, :case_about, :string
  end
end
