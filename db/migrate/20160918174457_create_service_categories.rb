class CreateServiceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :service_categories do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.attachment :image
    end

    change_table :services do |t|
      t.remove :name, :price, :description
      t.belongs_to :service_category, index: true
    end
  end
end
