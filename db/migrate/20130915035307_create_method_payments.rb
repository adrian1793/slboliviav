class CreateMethodPayments < ActiveRecord::Migration
  def change
    create_table :method_payments do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
