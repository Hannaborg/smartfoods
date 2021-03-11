class AddSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :number
      t.string :description
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
