require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'valid if quantity is present' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Chapo', measurement_unit: 'grams', price: 150)
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    @recipe_food = @recipe.recipe_foods.create(quantity: 5, food_id: @food.id)
    expect(@recipe).to be_valid
  end

  it 'valid if quantity is present' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Chapo', measurement_unit: 'grams', price: 150)
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    @recipe_food = @recipe.recipe_foods.create(food_id: @food.id)
    expect(@recipe).to_not be_valid
  end

  it 'must be associated with a recipe' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Chapo', measurement_unit: 'grams', price: 150)
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    @recipe_food = RecipeFood.create(quantity: 5, food_id: @food.id)
    expect(@recipe).to be_valid
  end
end
