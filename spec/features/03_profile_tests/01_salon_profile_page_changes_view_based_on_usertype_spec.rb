require 'rails_helper'

describe 'Salon page changes display based on type of user' do
  feature 'should navigate to the salon profile page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:user_stylist) { create(:user, user_type: 'stylist') }
    let!(:user_client) { create(:user, user_type: 'client') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }

    scenario 'owner should see the owner management console' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')

      expect(page).to have_content('owner management console')
      expect(page).to have_content(salon.name)
      expect(page).to have_link('edit salon')
    end

    scenario 'client should see the client console, past appointments and salon info' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('log in')

      expect(page).to have_content('client management console')
      expect(page).to have_content('salon info')
      expect(page).to have_content('past appointments')
    end

    scenario 'stylist should see the stylist console, client list and salon info' do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_stylist.email
      fill_in 'password', with: user_stylist.password
      click_button('log in')

      expect(page).to have_content('services management')
      expect(page).to have_content('salon info')
      expect(page).to have_content('clients')
    end
  end
end
