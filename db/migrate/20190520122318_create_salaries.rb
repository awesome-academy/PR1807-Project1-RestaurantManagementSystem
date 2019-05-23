class CreateSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :salaries do |t|
      t.float :salary
      t.date :from_date
      t.date :to_date
      t.references :staff 
      t.timestamps
    end
  end
end
