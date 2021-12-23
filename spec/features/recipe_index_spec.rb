require 'rails_helper'

RSpec.feature 'Recipe #Index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Dammy', email: 'dammy@gmail.com', password: 'qwerty')
    @recipe = Recipe.create(name: 'Curry', description: 'Very nice one', cooking_time: 10, preparation_time: 20,
                            user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'
    visit recipes_path
  end

  scenario 'show My Recipes on page' do
    expect(page).to have_content 'My Recipes'
  end

  scenario 'show recipe details on page' do
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.description
    expect(page).to have_content @recipe.cooking_time
    expect(page).to have_content @recipe.preparation_time
    expect(page).not_to have_content 'Cheese'
  end

  scenario 'show Add Food button on page' do
    expect(page).to have_button 'Create A Recipe'
  end

  scenario 'Should display a delete button' do
    expect(page).to have_link 'Remove'
  end
end
