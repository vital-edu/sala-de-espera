class ChangeImageAttribute < ActiveRecord::Migration[5.0]
  def up
    remove_column :service_categories, :image_file_name
    remove_column :service_categories, :image_content_type
    remove_column :service_categories, :image_file_size
    remove_column :service_categories, :image_updated_at
    add_column :service_categories, :image_data, :text
  end

  def down
    remove_column :service_categories, :image
    add_column :service_categories, :image_file_name, :string
    add_column :service_categories, :image_content_type, :string
    add_column :service_categories, :image_file_size, :integer
    add_column :service_categories, :image_updated_at, :datetime
  end
end
