class CreateRecords < ActiveRecord::Migration[4.2]

  def change
    create_table :records do |t|
      t.string :weight
      t.string :height
      t.string :sex
      t.string :age
      t.string :bmi
      t.string :status
      t.string :ideal_weight
      t.string :risk
      t.string :weight_to_lose
      t.string :weight_to_gain
      t.string :bmr
      t.integer :user_id
      t.integer :advice_id

      t.timestamps
    end
  end

end
