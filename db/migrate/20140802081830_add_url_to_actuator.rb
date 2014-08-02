class AddUrlToActuator < ActiveRecord::Migration
  def change
    add_column :actuators, :url, :string
  end
end
