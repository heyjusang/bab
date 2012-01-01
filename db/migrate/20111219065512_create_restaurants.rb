class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :resname
      t.integer :phone
      t.integer :point
      t.integer :count
      t.text :resinfo
      t.integer :restype
      t.timestamps
    end
  end
end
