class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :type
      t.string :type_person
      t.integer :speciality_area_id
      t.string :case_about
      t.string :need_help
      t.integer :monthly_income
      t.integer :method_payment_id

      t.text :description

      t.timestamps
    end
  end
end
