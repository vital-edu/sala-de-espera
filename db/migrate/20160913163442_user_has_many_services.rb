class UserHasManyServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :services, :user
  end
end
