class ChangeNeedHelpToRequest < ActiveRecord::Migration
  def change
    rename_column :requests, :need_help_id, :practice_area_id

  end
end
