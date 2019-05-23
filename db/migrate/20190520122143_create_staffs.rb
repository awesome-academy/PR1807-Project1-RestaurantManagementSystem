class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :gender, default: 'male'
      t.date :birth_date
      t.string :title
      t.float :base_salary
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
