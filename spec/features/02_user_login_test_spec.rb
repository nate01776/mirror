require 'rails_helper'

describe 'User sign in page' do
  feature 'should allow existing users to sign in' do
    let!(:user_1) { create(:user) }

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

    scenario 'should click log in and see an email and password field' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_1.email
      fill_in 'password', with: user_1.password
      click_button('Log in')

      expect(page).to have_content(user_1.first_name)
      expect(page).to have_content(user_1.last_name)
      expect(page).to have_content(client)
    end
  end
end
