require 'rails_helper'

describe 'User sign in page' do
  feature 'should allow users to sign up as client(default), stylist or owner' do
    let!(:user_client) { create(:user) }

    scenario 'should enter information into fields, click sign up and be logged in as stylist' do
      visit '/'
      click_link 'sign up'

      fill_in 'email', with: 'factorygirl@gmail.com'
      fill_in 'username', with: 'factorygirl'
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'
      fill_in 'first name', with: 'Factory'
      fill_in 'last name', with: 'Girl'
      find('#user-type').select('stylist')

      click_button 'Sign up'

      expect(page).to have_content('Factory')
      expect(page).to have_content('Girl')
      expect(page).to have_content('factorygirl@gmail.com')
      expect(page).to have_content('factorygirl')
      expect(page).to have_content('stylist')
    end

    scenario 'should enter information into fields, click sign up and be logged in as owner' do
      visit '/'
      click_link 'sign up'

      fill_in 'email', with: 'factorygirl@gmail.com'
      fill_in 'username', with: 'factorygirl'
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'
      fill_in 'first name', with: 'Factory'
      fill_in 'last name', with: 'Girl'
      find('#user-type').select('owner')

      click_button 'Sign up'

      expect(page).to have_content('Factory')
      expect(page).to have_content('Girl')
      expect(page).to have_content('factorygirl@gmail.com')
      expect(page).to have_content('factorygirl')
      expect(page).to have_content('owner')
      binding.pry
    end
  end
end
