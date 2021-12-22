class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: %i[create destroy]

  def create
    @recipe_foods = @recipe.recipe_foods.build(recipe_foods_params)

    respond_to do |format|
      format.html do
        if @recipe_foods.save
          redirect_to recipe_path(@recipe.id), notice: 'Ingredient saved successfully'
        else
          redirect_to recipe_path(@recipe.id), alert: 'Error, Recipe not created!'
        end
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.includes(:recipe, :food).find(params[:id])
    @recipe_food.delete

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe.id), notice: 'Ingredient deleted successfully' }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
