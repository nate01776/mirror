require 'rails_helper'

describe 'Owner can add new service salon' do
  feature 'should be added from salon page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:user_owner_2) {create(:user, user_type: 'owner') }
    let!(:user_client) { create(:user, user_type: 'client') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:salon_2) { create(:salon, owner_id: user_owner_2.id) }
    let!(:service) { create(:service, salon_id: salon.id) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should not be able to edit another owners location' do
      visit salon_path(salon_2.id)

      expect(page).to_not have_content('add new service')
      expect(page).to_not have_content('add new product')
    end

    scenario 'should not be able to add service another owners location' do
      visit new_salon_service_path(salon_2.id)

      expect(page).to_not have_button('add service')
      expect(page).to_not have_content('add new service')
      expect(page).to have_content('owner management console')
    end

    scenario 'should not be able to add product another owners location' do
      visit new_salon_product_path(salon_2.id)

      expect(page).to_not have_button('add product')
      expect(page).to_not have_content('add new product')
      expect(page).to have_content('owner management console')
    end
  end
end
