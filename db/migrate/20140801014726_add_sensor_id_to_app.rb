class AddSensorIdToApp < ActiveRecord::Migration
  def change
    add_column :apps, :sensor_id, :integer
  end
end
