require 'rails_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers
  feature 'user should be able to add and edit profile image' do
    let!(:user_client) { create(:user) }
    let(:uploader) { ImageUploader.new(user, :image) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('log in')
    end

    scenario 'User can see upload link if not added file' do
      expect(page).to have_link('add user image')
      click_link('add user image')
      expect(page).to have_button('Update User')
    end

    scenario 'User can upload file, displayed behind user info' do
      click_link('add user image')
      attach_file('upload-here', './spec/images/doge.jpg')
      click_button('Update User')
      expect(page).to have_content('upcoming appointments')
      expect(find_by_id('user-profile-info')[:style]).to have_content('doge.jpg')
    end

    scenario 'User clicks "update user", but doesnt add file and is returned to their root' do
      click_link('add user image')
      click_button('Update User')
      expect(page).to have_content('upcoming appointments')
    end
  end
end
