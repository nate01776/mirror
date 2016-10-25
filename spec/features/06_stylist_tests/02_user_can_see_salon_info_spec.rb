# require 'rails_helper'
#
# describe 'User opens profile page by default' do
#   feature 'should see user info, salon info' do
#     let!(:user_client) { create(:user) }
#     let!(:user_owner) { create(:user, user_type: 'owner') }
#     let!(:user_stylist) { create(:user, user_type: 'stylist') }
#     let!(:salon) { create(:salon, owner_id: user_owner.id) }
#     let!(:salon_2) { create(:salon, owner_id: user_owner.id) }
#     let!(:service) { create(:service, salon_id: salon.id) }
#     let!(:product) { create(:product, salon_id: salon.id) }
#
#
#     before :each do
#       salon.users << user_client
#       salon_2.users << user_client
#       salon_2.users << user_stylist
#       salon_2.services << service
#       salon_2.products << product
#       visit '/'
#       click_link 'log in'
#       fill_in 'email', with: user_client.email
#       fill_in 'password', with: user_client.password
#       click_button('log in')
#     end
#
#     scenario 'user should see list of all their salons after clicking link' do
#       visit '/'
#       click_link 'see all my salons'
#       expect(page).to have_content(salon.name)
#       expect(page).to have_content(salon_2.name)
#     end
#
#     scenario 'user should click link to see salon profile page' do
#       visit '/'
#       click_link 'see all my salons'
#       click_link salon.name
#       expect(page).to have_content(salon.name)
#       expect(page).to have_content('services')
#       expect(page).to have_content('stylists')
#       expect(page).to have_content('products')
#     end
#
#     scenario 'user should see salons services' do
#       visit '/'
#       click_link salon_2.name
#       expect(page).to have_content(service.name)
#       expect(page).to have_content(service.price)
#       expect(page).to have_content(service.time)
#       expect(page).to have_content(service.description)
#     end
#
#     scenario 'user should see salons stylists' do
#       visit '/'
#       click_link salon_2.name
#       expect(page).to have_content(user_stylist.full_name)
#     end
#
#     scenario 'user should see salons products' do
#       visit '/'
#       click_link salon_2.name
#       expect(page).to have_content(product.name)
#       expect(page).to have_content(product.price)
#       expect(page).to have_content(product.description)
#     end
#   end
# end
