require 'rails_helper'

describe 'User should favorite services' do
  feature 'should see button on salon profile page' do
    let!(:user_client) { create(:user) }
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:user_stylist) { create(:user, user_type: 'stylist') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:salon_2) { create(:salon, owner_id: user_owner.id) }
    let!(:service) { create(:service, salon_id: salon.id) }
    let!(:product) { create(:product, salon_id: salon.id) }

    before :each do
      salon.users << user_client
      salon_2.users << user_client
      salon_2.users << user_stylist
      salon_2.services << service
      salon_2.products << product
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_stylist.email
      fill_in 'password', with: user_stylist.password
      click_button('log in')
    end

    scenario 'user should see button to favorite service' do
      visit '/'
      click_link salon_2.name
      expect(page).to have_link('+')
    end
  end
end
