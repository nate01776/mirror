require 'rails_helper'

describe 'Owner can create new salon' do
  feature 'should see owner management console' do
    let!(:user_client) { create(:user) }
    let!(:user_owner) { create(:user, user_type: 'owner') }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see new salon button on homepage' do
      visit '/'
      expect(page).to have_content('owner management console')
      expect(page).to have_link('+ new location')
    end

    scenario 'click new location and see form to add new location' do
      visit '/'
      click_link '+ new location'

      expect(page).to have_field('Name')
      expect(page).to have_field('Address')
      expect(page).to have_field('City')
      expect(page).to have_field('State')
      expect(page).to have_field('Zip Code')
      expect(page).to have_field('Email')
      expect(page).to have_field('Phone')
    end

    scenario 'adding a new location will redirect to user profile, location added to management console' do
      visit '/'
      click_link '+ new location'

      fill_in 'Name', with: 'Test Salon'
      fill_in 'Address', with: '123 Test St'
      fill_in 'City', with: 'Boston'
      fill_in 'State', with: 'MA'
      fill_in 'Zip Code', with: '02118'
      fill_in 'Email', with: 'testemail@gmail.com'
      fill_in 'Phone', with: '931-212-1242'
      click_button 'add location'

      expect(page).to have_content('owner management')
      expect(page).to have_content('Test Salon')
    end

    scenario 'adding a new location will redirect to user profile, location added to management console' do
      visit '/'
      click_link '+ new location'

      fill_in 'Name', with: 'Test Salon'
      fill_in 'Address', with: '123 Test St'
      click_button 'add location'

      expect(page).to have_content('City can\'t be blank')
      expect(page).to have_content('Phone can\'t be blank')
    end

    scenario 'if a non owner finds their way to the salons/new page, they cannot add a location' do
      visit '/'
      click_link 'X'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('log in')
      visit new_salon_path

      fill_in 'Name', with: 'Test Salon'
      fill_in 'Address', with: '123 Test St'
      fill_in 'City', with: 'Boston'
      fill_in 'State', with: 'MA'
      fill_in 'Zip Code', with: '02118'
      fill_in 'Email', with: 'testemail@gmail.com'
      fill_in 'Phone', with: '931-212-1242'
      click_button 'add location'

      expect(page).to have_content('Owner must be the creator!')
    end
  end
end
