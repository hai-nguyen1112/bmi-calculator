class CreateAdvices <ActiveRecord::Migration[4.2]

  def change
    create_table :advices do |t|
      t.text :diet
      t.text :exercise

      t.timestamps
    end
  end

end
