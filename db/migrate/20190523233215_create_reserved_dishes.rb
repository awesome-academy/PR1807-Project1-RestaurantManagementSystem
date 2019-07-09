class CreateReservedDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :reserved_dishes do |t|
      t.references :reservation, foreign_key: true
      t.references :dish, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
