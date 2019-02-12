class CreateRecords < ActiveRecord::Migration[4.2]

  def change
    create_table :records do |t|
      t.string :weight
      t.string :height_ft
      t.string :height_in
      t.string :sex
      t.string :age
      t.string :bmi
      t.string :status
      t.string :ideal_weight
      t.string :risk
      t.string :difference_between_ideal_weight
      t.string :bmr
      t.integer :user_id
      t.string :goal
      t.string :cals_to_burn_per_day
      t.string :cals_to_consume_per_day

      t.timestamps
    end
  end

end
