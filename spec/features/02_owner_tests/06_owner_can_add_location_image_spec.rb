require 'rails_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers
  feature 'user should be able to add and edit profile image' do

    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let(:uploader) { ImageUploader.new(user, :image) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_owner.email
      fill_in 'password', with: user_owner.password
      click_button('log in')
    end

    scenario 'Owner can see upload link on edit salon page' do
      click_link('edit salon')
      expect(page).to have_field('upload-here')
    end

    scenario 'Owner can upload file, displayed behind salon info' do
      click_link('edit salon')
      attach_file('upload-here', './spec/images/pensive_pupper.jpg')
      click_button('update location')
      expect(page).to have_content('owner management console')
      expect(find_by_id('salon-profile-' + salon.id.to_s)[:style]).to have_content('pensive_pupper.jpg')
    end

    scenario 'Owner edits salon info, but doesnt add file they are returned to root with image still there' do
      click_link('edit salon')
      attach_file('upload-here', './spec/images/pensive_pupper.jpg')
      click_button('update location')
      expect(page).to have_content('owner management console')
      expect(find_by_id('salon-profile-' + salon.id.to_s)[:style]).to have_content('pensive_pupper.jpg')
      click_link('edit salon')
      fill_in 'City', with: 'Cambridge'
      click_button('update location')
      expect(find_by_id('salon-profile-' + salon.id.to_s)[:style]).to have_content('pensive_pupper.jpg')
      expect(page).to have_content('owner management console')
    end
  end
end
