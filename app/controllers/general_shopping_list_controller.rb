class GeneralShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipes
  end
end
