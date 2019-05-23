class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :password
      t.string :phone_number
      t.string :gender, default: 'male'
      t.date :birth_date
      t.integer :permission
      t.string :activation_digest
      t.datetime :activated_at
      t.boolean :activated
      t.string :reset_digest

      t.timestamps
    end
  end
end
