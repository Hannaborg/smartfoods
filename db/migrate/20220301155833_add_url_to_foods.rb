class AddUrlToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :url, :string
  end
end
