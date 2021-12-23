require 'rails_helper'

RSpec.feature 'Food #Index', type: :feature do
  background do
   @user = User.create(name: "Kalunge", email: "admin40@gmail.com", password: "qwerty")

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'
    visit foods_path
  end

  # scenario 'show My Foods on page' do
  #   expect(page).to have_content 'My Foods'
  # end

  scenario 'show food details on page' do
    # @user = User.create(name: "Kalunge", email: "1@4.com", password: "qwerty")
    @food = @user.foods.create!(name: "Mukimo", measurement_unit: "grams", price: 50)
    expect(page).to have_content @food.name
    expect(page).to have_content @food.measurement_unit
    expect(page).to have_content @food.price
    expect(page).not_to have_content 'Cheese'
  end

  scenario 'show Add Food button on page' do
    expect(page).to have_button 'Add Food'
  end

  scenario 'Should display a delete button' do
    expect(page).to have_button('Delete Food')
  end

end
