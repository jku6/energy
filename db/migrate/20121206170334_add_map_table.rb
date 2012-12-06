class AddMapTable < ActiveRecord::Migration
  def change
    create_table :maps do |t|
        t.integer :zip
        t.float :lat
        t.float :long
        t.string :building_type
        t.string :kwh
        t.timestamps
    end
  end
end
