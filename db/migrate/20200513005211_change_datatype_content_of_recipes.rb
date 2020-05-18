class ChangeDatatypeContentOfRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :content, :text
  end
end
