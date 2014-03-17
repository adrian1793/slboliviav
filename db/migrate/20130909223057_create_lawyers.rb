class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :address
      t.string :department
      t.string :city
      t.integer :phone
      t.integer :cell_phone

      t.timestamps
    end
  end
end
