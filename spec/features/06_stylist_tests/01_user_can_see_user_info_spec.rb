require 'rails_helper'

describe 'User opens profile page by default' do
  feature 'should see user info, salon info' do
    let!(:user_stylist) { create(:user, user_type: 'stylist') }
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_stylist.email
      fill_in 'password', with: user_stylist.password
      click_button('log in')
    end

    scenario 'should see user profile info' do
      salon.users << user_stylist
      visit '/'
      expect(page).to have_content('user info')
      expect(page).to have_content(user_stylist.username)
      expect(page).to have_content(user_stylist.email)
      expect(page).to have_content(user_stylist.full_name)
    end

    scenario 'should see salon profile info' do
      salon.users << user_stylist
      visit '/'
      expect(page).to have_content('salon info')
      expect(page).to have_content(salon.name)
      expect(page).to have_content(salon.address)
      expect(page).to have_content(salon.city)
      expect(page).to have_link('search for new salons')
    end

    scenario 'should see message if no salons added' do
      visit '/'
      expect(page).to have_content('Looking for a new salon?')
    end
  end
end
