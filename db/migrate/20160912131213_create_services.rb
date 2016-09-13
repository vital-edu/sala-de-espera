class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.datetime :schedule
      t.decimal :price
      t.integer :status

      t.timestamps
    end
  end
end
