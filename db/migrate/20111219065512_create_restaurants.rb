class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :resname
      t.string :phone
      t.integer :tastepoint
      t.integer :speedpoint
      t.integer :servicepoint
      t.integer :amountpoint
      t.integer :count
      t.has_attached_file :avatar
      t.text :resinfo
      t.string :restype
      t.timestamps
    end
  end
end
