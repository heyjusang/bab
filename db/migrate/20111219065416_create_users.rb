class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mailname
      t.string :username
      t.string :password
      t.string :authorize_token
      t.boolean :authorized
      t.boolean :mailcheck
      t.timestamps
    end
  end
end
