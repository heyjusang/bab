class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :content 
      t.integer :user_id
      t.string :mail
      t.timestamps
    end
  end
end
