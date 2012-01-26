class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :resname
      t.string :phone
      t.decimal :tastepoint, :precision => 3, :scale => 2
      t.decimal :speedpoint, :precision => 3, :scale => 2
      t.decimal :servicepoint, :precision => 3, :scale => 2
      t.decimal :amountpoint, :precision => 3, :scale => 2
      t.integer :count
      t.text :resinfo
      t.string :restype
      t.string :imageurl
      t.timestamps
    end
  end
end
