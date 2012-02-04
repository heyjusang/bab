class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|

      t.string :date
      t.integer :res_id
      t.timestamps
    end
  end
end
