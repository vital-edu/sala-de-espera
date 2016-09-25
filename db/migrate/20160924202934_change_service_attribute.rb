class ChangeServiceAttribute < ActiveRecord::Migration[5.0]
  def change
    rename_column :services, :schedule, :scheduled_time
  end
end
