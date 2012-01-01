class CreateGoodbads < ActiveRecord::Migration
  def change
    create_table :goodbads do |t|

      t.references :menu
      t.references :user
      t.boolean :good
      t.boolean :bad
      t.timestamps
    end
  end
end
