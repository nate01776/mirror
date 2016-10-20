require 'rails_helper'

describe 'User sign in page' do
  feature 'should allow existing users to sign in' do
    let!(:user_client) { create(:user) }

    scenario 'should see log in button on homepage' do
      visit '/'
      expect(page).to have_content('log in')
    end

    scenario 'should click log in and see an email and password field' do
      visit '/'
      click_link 'log in'

      expect(page).to have_field('email')
      expect(page).to have_field('password')
    end

    scenario 'should enter unregistered email and not be logged in' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: 'unreg_user@gmail.com'
      fill_in 'password', with: 'test'
      click_button('log in')

      expect(page).to have_content('Invalid Email or password')
    end
  end
end
