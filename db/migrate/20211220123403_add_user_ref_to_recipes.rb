class AddUserRefToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end
