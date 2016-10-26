require 'rails_helper'

describe 'Owner can delete salon service and products' do
  feature 'should be able to do both on salon profile page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:user_owner_2) { create(:user, user_type: 'owner') }
    let!(:user_client) { create(:user) }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:salon_2) { create(:salon, owner_id: user_owner_2.id) }
    let!(:service) { create(:service, salon_id: salon.id) }
    let!(:product) { create(:product, salon_id: salon.id) }

    before (:each) do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see delete links below products' do
      salon.products << product
      visit salon_path(salon.id)

      expect(page).to have_content(product.name)
      expect(page).to have_content('Delete this product')
    end

    scenario 'should remove product when link is clicked' do
      salon.products << product
      visit salon_path(salon.id)
      click_link 'Delete this product'

      expect(page).to_not have_content(product.name)
    end

    scenario 'should see delete links below services' do
      salon.services << service
      visit salon_path(salon.id)

      expect(page).to have_content(service.name)
      expect(page).to have_content('Delete this service')
    end

    scenario 'should remove service when link is clicked' do
      salon.services << service
      visit salon_path(salon.id)
      click_link 'Delete this service'

      expect(page).to_not have_content(service.name)
    end
  end
end
