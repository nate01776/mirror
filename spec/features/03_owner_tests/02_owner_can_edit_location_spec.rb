require 'rails_helper'

describe 'Owner can update salon' do
  feature 'should see owner management console' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see their salons in the owner management console and edit link' do
      visit '/'

      expect(page).to have_content('owner management console')
      expect(page).to have_content(salon.name)
      expect(page).to have_link('edit salon')
    end

    scenario 'clicking edit salon link should show edit form' do
      visit '/'
      click_link('edit salon')

      expect(page).to have_field('Name')
      expect(page).to have_field('Address')
      expect(page).to have_field('State')
      expect(page).to have_field('City')
      expect(page).to have_field('Zip Code')
      expect(page).to have_field('Email')
      expect(page).to have_field('Phone')
      expect(page).to have_button('update location')
    end

    scenario 'clicking edit salon link should show edit form' do
      visit '/'
      click_link('edit salon')
      fill_in 'Name', with: 'Updated Salon Name'
      click_button('update location')

      expect(page).to have_content('owner management console')
      expect(page).to have_content('Updated Salon Name')
    end
  end
end
