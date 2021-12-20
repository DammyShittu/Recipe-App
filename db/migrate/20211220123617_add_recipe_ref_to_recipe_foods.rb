class AddRecipeRefToRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipe_foods, :recipe, null: false, foreign_key: true
  end
end
