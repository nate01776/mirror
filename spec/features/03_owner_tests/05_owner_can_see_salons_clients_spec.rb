require 'rails_helper'

describe 'Owner can add new service salon' do
  feature 'should be added from salon page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:user_client) { create(:user, user_type: 'client') }
    let!(:user_stylist) { create(:user, user_type: 'stylist') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:product) { create(:product, salon_id: salon.id) }

    before :each do
      salon.users << user_client
      salon.users << user_stylist
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see their salons clients on the salon profile page' do
      visit '/'

      click_link salon.name

      expect(page).to have_content(user_client.full_name)
    end

    scenario 'should see their salons stylists on the salon profile page' do
      visit '/'

      click_link salon.name

      expect(page).to have_content(user_stylist.full_name)
    end

    scenario 'should be able to click client name to see profile page' do
      visit '/'

      click_link salon.name

      click_link (user_client.full_name)

      expect(page).to have_content(user_client.full_name + ' user profile')
      expect(page).to have_content(user_client.email)
      expect(page).to have_content(user_client.username)
    end
  end
end
