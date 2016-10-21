# require 'rails_helper'
#
# describe 'Salon page changes display based on ' do
#   feature 'should navigate to the salon profile page' do
#     let!(:user_owner) { create(:user, user_type: 'owner') }
#     let!(:user_stylist) { create(:user, user_type: 'stylist') }
#     let!(:user_client) { create(:user, user_type: 'client') }
#     let!(:salon) { create(:salon, user: user_owner) }
#
#     scenario 'should see their salons in the owner management console and edit link' do
#       visit '/'
#       click_link 'log in'
#       fill_in 'email', with: user_client.email
#       fill_in 'password', with: user_client.password
#       click_button('log in')
#
#       expect(page).to have_content('owner management console')
#       expect(page).to have_content(salon.name)
#       expect(page).to have_link('edit salon')
#     end
#   end
# end
