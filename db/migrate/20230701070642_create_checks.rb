class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.integer :user_id, null: false
      t.integer :tired, null:false
      t.integer :lightheadedness, null:false
      t.integer :dizzy, null:false
      t.integer :headache, null:false
      t.integer :stiff_neck, null:false
      t.integer :cold, null:false
      t.integer :anemia, null:false
      t.integer :bring_up, null:false
      t.integer :pulsation, null:false
      t.integer :stomachache, null:false
      t.timestamps
    end
  end
end
