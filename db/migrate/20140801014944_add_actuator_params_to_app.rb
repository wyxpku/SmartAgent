class AddActuatorParamsToApp < ActiveRecord::Migration
  def change
    add_column :apps, :actuator_params, :text
  end
end
