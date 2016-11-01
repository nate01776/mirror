require 'rails_helper'

describe 'User opens profile page by default' do
  feature 'should see user info, salon info' do
    let!(:user_client) { create(:user) }
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('log in')
    end

    scenario 'should see user profile info' do
      salon.users << user_client
      visit '/'
      expect(page).to have_content('user info')
      expect(page).to have_content(user_client.username)
      expect(page).to have_content(user_client.email)
      expect(page).to have_content(user_client.full_name)
    end

    scenario 'should see salon profile info' do
      salon.users << user_client
      visit '/'
      expect(page).to have_content('recent salon info')
      expect(page).to have_content(salon.name)
      expect(page).to have_content(salon.address)
      expect(page).to have_content(salon.city)
      expect(page).to have_link('see all salons')
    end

    scenario 'should see message if no salons added' do
      visit '/'
      expect(page).to have_content('No salons added yet!')
    end
  end
end
