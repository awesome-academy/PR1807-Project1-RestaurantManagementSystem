class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :promotion
      t.string :status, default: true
      t.references :category 
      t.timestamps
    end
  end
end
