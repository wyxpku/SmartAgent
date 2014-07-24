class CreateActuators < ActiveRecord::Migration
  def change
    create_table :actuators do |t|
      t.string :name
      t.text :capbility

      t.timestamps
    end
  end
end
