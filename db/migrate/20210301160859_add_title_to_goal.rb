class AddTitleToGoal < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :title, :string
  end
end
