class AddUrlToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :url, :string
  end
end
