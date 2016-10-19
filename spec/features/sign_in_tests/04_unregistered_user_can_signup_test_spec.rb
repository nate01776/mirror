require 'rails_helper'

describe 'User sign in page' do
  feature 'should allow existing users to sign in' do
    let!(:user_client) { create(:user) }

    scenario 'should see log in button on homepage' do
      visit '/'
      expect(page).to have_content('log in')
    end

    scenario 'should click sign up and see sign up form' do
      visit '/'
      click_link 'sign up'

      expect(page).to have_field('email')
      expect(page).to have_field('username')
      expect(page).to have_field('password')
      expect(page).to have_field('confirm password')
      expect(page).to have_field('first name')
      expect(page).to have_field('last name')
    end

    scenario 'should enter information into fields, click sign up and be logged in as client' do
      visit '/'
      click_link 'sign up'

      fill_in 'email', with: 'factorygirl@gmail.com'
      fill_in 'username', with: 'factorygirl'
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'
      fill_in 'first name', with: 'Factory'
      fill_in 'last name', with: 'Girl'

      click_button 'Sign up'

      expect(page).to have_content('Factory')
      expect(page).to have_content('Girl')
      expect(page).to have_content('factorygirl@gmail.com')
      expect(page).to have_content('factorygirl')
      expect(page).to have_content('client')
    end

    scenario 'should provide errors if form incorrectly filled out' do
      visit '/'
      click_link 'sign up'

      fill_in 'username', with: 'factorygirl'
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'

      click_button 'Sign up'

      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('First name can\'t be blank')
      expect(page).to have_content('Last name can\'t be blank')
    end

    scenario 'should check for a valid email address' do
      visit '/'
      click_link 'sign up'

      fill_in 'email', with: 'factorygirl@gmail'
      fill_in 'username', with: 'factorygirl'
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'
      fill_in 'first name', with: 'Factory'
      fill_in 'last name', with: 'Girl'

      click_button 'Sign up'

      expect(page).to have_content('Email is invalid')
    end

    scenario 'should not be able to sign up if email is in use' do
      visit '/'
      click_link 'sign up'

      fill_in 'email', with: user_client.email
      fill_in 'username', with: 'factorygirl'
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'
      fill_in 'first name', with: 'Factory'
      fill_in 'last name', with: 'Girl'

      click_button 'Sign up'

      expect(page).to have_content('Email has already been taken')
    end

    scenario 'should not be able to sign up if username is in use' do
      visit '/'
      click_link 'sign up'

      fill_in 'email', with: 'factorygirl@gmail'
      fill_in 'username', with: user_client.username
      fill_in 'password', with: 'factorygirl'
      fill_in 'confirm password', with: 'factorygirl'
      fill_in 'first name', with: 'Factory'
      fill_in 'last name', with: 'Girl'

      click_button 'Sign up'

      expect(page).to have_content('Username has already been taken')
    end
  end
end
