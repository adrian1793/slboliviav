class AddColumsToPracticeArea < ActiveRecord::Migration
  def change
    add_column :practice_areas, :name_english, :string
    add_column :practice_areas, :name_portuguese, :string

    add_column :speciality_areas, :name_english, :string
    add_column :speciality_areas, :name_portuguese, :string

  end
end
