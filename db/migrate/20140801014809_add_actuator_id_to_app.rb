class AddActuatorIdToApp < ActiveRecord::Migration
  def change
    add_column :apps, :actuator_id, :integer
  end
end
