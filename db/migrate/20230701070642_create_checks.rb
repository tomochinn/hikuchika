class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.integer :user_id, null: false
      t.string :low_blood_pressure_check, null: false
      t.integer :minimum_blood_pressure, null: false
      t.integer :maximum_blood_pressure, null: false
      t.timestamps
    end
  end
end
