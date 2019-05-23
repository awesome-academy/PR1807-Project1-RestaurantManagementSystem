class CreateReservedDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :reserved_dishes do |t| 
      t.integer :quantity
      t.references :reservation
      t.references :dish
      t.timestamps
    end
  end
end
