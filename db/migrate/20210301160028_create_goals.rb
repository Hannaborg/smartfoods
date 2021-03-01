class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :usergoal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
