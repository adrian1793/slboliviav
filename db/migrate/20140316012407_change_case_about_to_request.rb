class ChangeCaseAboutToRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :case_about_id
    add_column :requests, :case_about, :string
  end
end
