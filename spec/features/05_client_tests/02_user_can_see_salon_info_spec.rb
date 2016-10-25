require 'rails_helper'

describe 'User opens profile page by default' do
  feature 'should see user info, salon info' do
    let!(:user_client) { create(:user) }
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:salon_2) { create(:salon, owner_id: user_owner.id) }

    before :each do
      salon.users << user_client
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('log in')
    end

    scenario 'user should see list of all their salons after clicking link' do
      visit '/'
      click_link 'see all my salons'
      expect(page).to have_content(salon.name)
      expect(page).to have_content(salon_2.name)
    end
  end
end
