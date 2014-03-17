class CreateSpecialityAreas < ActiveRecord::Migration
  def change
    create_table :speciality_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
