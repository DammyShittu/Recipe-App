class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @recipes = Recipe.where(public: true).order(updated_at: :desc)
  end
end
