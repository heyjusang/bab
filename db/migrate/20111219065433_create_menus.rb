class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menuname
      t.integer :price
      t.integer :like
      t.integer :dislike
      t.references :restaurant
      t.boolean :setmenu

      t.timestamps
    end
  end
end

