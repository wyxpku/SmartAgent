class AddUserIdToActuator < ActiveRecord::Migration
  def change
    add_column :actuators, :user_id, :integer
  end
end
