class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :company
      t.string :ci
      t.date :date_of_birth
      t.string :gender
      t.string :address
      t.string :department
      t.string :city
      t.integer :phone
      t.string :cell_phone

      t.timestamps
    end
  end
end
