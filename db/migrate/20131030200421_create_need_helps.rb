class CreateNeedHelps < ActiveRecord::Migration
  def change
    create_table :need_helps do |t|
      t.string :name

      t.timestamps
    end
  end
end
