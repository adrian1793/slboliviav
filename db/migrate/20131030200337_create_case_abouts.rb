class CreateCaseAbouts < ActiveRecord::Migration
  def change
    create_table :case_abouts do |t|
      t.string :name

      t.timestamps
    end
  end
end
