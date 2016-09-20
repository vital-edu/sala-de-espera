class AddTimestampsToServiceCategories < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :service_categories
  end
end
