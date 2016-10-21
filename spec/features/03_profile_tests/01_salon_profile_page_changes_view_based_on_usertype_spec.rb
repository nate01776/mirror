# require 'rails_helper'
#
# describe 'Salon page changes display based on ' do
#   feature 'should see owner management console' do
#     let!(:user_owner) { create(:user, user_type: 'owner') }
#     let!(:user_owner) { create(:user, user_type: 'stylist') }
#     let!(:user_owner) { create(:user, user_type: 'client') }
#     let!(:salon) { create(:salon, user: user_owner) }
#
#     scenario 'should see their salons in the owner management console and edit link' do
#       visit '/'
#
#       expect(page).to have_content('owner management console')
#       expect(page).to have_content(salon.name)
#       expect(page).to have_link('edit salon')
#     end
#
#     scenario 'clicking edit salon link should show edit form' do
#       visit '/'
#       click_link('edit salon')
#
#       expect(page).to have_field('Name')
#       expect(page).to have_field('Address')
#       expect(page).to have_field('State')
#       expect(page).to have_field('City')
#       expect(page).to have_field('Zip Code')
#       expect(page).to have_field('Email')
#       expect(page).to have_field('Phone')
#       expect(page).to have_button('update location')
#     end
#
#     scenario 'clicking edit salon link should show edit form' do
#       visit '/'
#       click_link('edit salon')
#       fill_in 'Name', with: 'Updated Salon Name'
#       click_button('update location')
#
#       expect(page).to have_content('owner management console')
#       expect(page).to have_content('Updated Salon Name')
#     end
#   end
# end
