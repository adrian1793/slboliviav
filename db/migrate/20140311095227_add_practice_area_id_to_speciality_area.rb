class AddPracticeAreaIdToSpecialityArea < ActiveRecord::Migration
  def change
    add_column :speciality_areas, :practice_area_id, :integer
  end
end
