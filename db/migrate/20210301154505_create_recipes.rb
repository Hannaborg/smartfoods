class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :cooking_time
      t.integer :rating

      t.timestamps
    end
  end
end
