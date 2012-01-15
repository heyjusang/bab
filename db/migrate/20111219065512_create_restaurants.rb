class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :resname
      t.integer :phone
      t.integer :tastepoint
      t.integer :speedpoint
      t.integer :servicepoint
      t.integer :amountpoint
      t.integer :count
      t.text :resinfo
      t.integer :restype
      t.string :imageurl
      t.timestamps
    end
  end
end
