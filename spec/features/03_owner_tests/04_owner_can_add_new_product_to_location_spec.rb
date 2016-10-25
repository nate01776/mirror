require 'rails_helper'

describe 'Owner can add new service salon' do
  feature 'should be added from salon page' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:product) { create(:product, salon_id: salon.id) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'should see their salons products on the salon profile page' do
      visit '/'

      click_link salon.name

      expect(page).to have_content(product.name)
    end

    scenario 'should see their salons in the owner management console and click on them, should see add new product link' do
      visit '/'

      expect(page).to have_content('owner management console')
      expect(page).to have_content(salon.name)
      expect(page).to have_link(salon.name)

      click_link salon.name

      expect(page).to have_content(product.name)
      expect(page).to have_link('add new product')
    end

    scenario 'should be able to add a new product and be returned to salon profile page' do
      visit '/'
      click_link salon.name
      click_link 'add new product'

      fill_in 'Name', with: 'another test product'
      fill_in 'Description', with: 'another test product description'
      click_button 'add product'

      expect(page).to have_content(salon.name)
      expect(page).to have_content('another test product')
    end

    scenario 'should be able to view a product profile page' do
      visit '/'
      click_link salon.name
      click_link product.name

      expect(page).to have_content(product.name)
      expect(page).to have_content(product.description)
      expect(page).to have_content(product.price)
    end
  end
end
