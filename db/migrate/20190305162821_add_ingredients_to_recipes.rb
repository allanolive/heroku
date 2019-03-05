class AddIngredientsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :ingredients, foreign_key: true
  end
end
