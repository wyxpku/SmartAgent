class AddSensorParamsToApp < ActiveRecord::Migration
  def change
    add_column :apps, :sensor_params, :text
  end
end
