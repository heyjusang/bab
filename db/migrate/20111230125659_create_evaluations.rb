class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :restaurant
      t.references :user
      t.integer :speed
      t.integer :taste
      t.integer :amount
      t.integer :service
      t.string :review
      t.timestamps
    end
  end
end
