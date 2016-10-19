require 'rails_helper'

describe 'User sign in page' do
  feature 'should allow existing users to sign in' do
    let!(:user_client) { create(:user) }
    let!(:user_stylist) { create(:user, is_stylist: true) }
    let!(:user_owner) { create(:user, is_owner: true) }

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
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('Log in')

      expect(page).to have_content(user_client.username)
      expect(page).to have_content(user_client.first_name)
      expect(page).to have_content(user_client.last_name)
    end

    scenario 'client user should see client profile page' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('Log in')

      expect(page).to have_content(user_client.username)
      expect(page).to have_content(user_client.first_name)
      expect(page).to have_content(user_client.last_name)
      expect(page).to have_content('client')
    end

    scenario 'stylist user should see stylist profile page' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_stylist.email
      fill_in 'password', with: user_stylist.password
      click_button('Log in')

      expect(page).to have_content(user_stylist.username)
      expect(page).to have_content(user_stylist.first_name)
      expect(page).to have_content(user_stylist.last_name)
      expect(page).to have_content('stylist')
    end

    scenario 'owner user should see owner profile page' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('Log in')

      expect(page).to have_content(user_owner.username)
      expect(page).to have_content(user_owner.first_name)
      expect(page).to have_content(user_owner.last_name)
      expect(page).to have_content('owner')
    end
  end
end
