class GeneralShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipes
    @foods = Food.joins(:recipe_foods).where(user_id: current_user.id)
    @total = 0
    @foods.each do |food|
      @total += food.price
    end
  end
end
