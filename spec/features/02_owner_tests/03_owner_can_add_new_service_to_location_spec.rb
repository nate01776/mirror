require 'rails_helper'

describe 'Owner can add new service salon' do
  feature 'should be added from salon page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:user_client) { create(:user, user_type: 'client') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:service) { create(:service, salon_id: salon.id) }

    before :each do
      salon.users << user_client
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see their salons services on the salon profile page' do
      visit '/'

      click_link salon.name

      expect(page).to have_content(service.name)
    end

    scenario 'should see their salons in the owner management console and click on them, should see add new service link' do
      visit '/'

      expect(page).to have_content('owner management console')
      expect(page).to have_content(salon.name)
      expect(page).to have_link(salon.name)

      click_link salon.name

      expect(page).to have_content(service.name)
      expect(page).to have_link('add new service')
    end

    scenario 'should be able to add a new service and be returned to salon profile page' do
      visit '/'
      click_link salon.name
      click_link 'add new service'

      fill_in 'Name', with: 'another test service'
      fill_in 'Description', with: 'another test service description'
      click_button 'add service'

      expect(page).to have_content(salon.name)
      expect(page).to have_content('another test service')
    end
  end
end
