class ChangeService < ActiveRecord::Migration[5.0]
  def change
    add_reference :services, :client, index: true
    rename_column :services, :user_id, :employee_id
  end
end
