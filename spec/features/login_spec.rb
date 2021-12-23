
require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'displays password field' do
    expect(page).to have_field('user[password]')
  end

  scenario 'displays email field' do
    expect(page).to have_button('Sign In')
  end

  context 'Form Submission' do
    scenario 'Submit form without email and password' do
      click_button 'Sign In'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with incorrect email and password' do
      fill_in 'Email', with: 'nomail@mail.com'
      fill_in 'Password', with: 'u5gh6rg'
      click_button 'Sign In'

      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with correct email and password' do
      @user = User.create(name: 'Titus', email: 'titus@gmail.com', password: 'password')
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign In'

      expect(page).to have_current_path(authenticated_root_path)
      expect(page).to have_content 'Signed in successfully.'
    end
  end
  # rubocop:enable Metrics/BlockLength
end
