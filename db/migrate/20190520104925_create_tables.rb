class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
