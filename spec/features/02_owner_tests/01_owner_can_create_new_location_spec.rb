require 'rails_helper'

describe 'Owner can create new salon' do
  feature 'should see owner management console' do
    let!(:user_client) { create(:user) }
    let!(:user_stylist) { create(:user, user_type: 'stylist') }
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
  end
end
