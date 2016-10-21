require 'rails_helper'

describe 'Owner can add new service salon' do
  feature 'should be added from salon page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, user: user_owner) }
    let!(:service) { create(:service, salon_id: salon.id) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see their salons in the owner management console and click on them' do
      visit '/'

      expect(page).to have_content('owner management console')
      expect(page).to have_content(salon.name)
      expect(page).to have_link(salon.name)

      click_link salon.name

      expect(page).to have_content
    end
  end
end
