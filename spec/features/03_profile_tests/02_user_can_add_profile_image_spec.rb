require 'rails_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers
  feature 'user should be able to add and edit profile image'

    let!(:user_client) { create(:user) }
    let(:uploader) { ImageUploader.new(user, :image) }

    before :each do
      visit '/'
      click_link 'log in'
      fill_in 'email', with: user_client.email
      fill_in 'password', with: user_client.password
      click_button('log in')
    end


    it 'User can see upload link if not added file' do
      expect(page).to have_link('add user image')
      click_link('add user image')
      expect(page).to have_button('Update User')
    end

    it 'User can upload file' do
      click_link('add user image')
      attach_file('upload-here', './spec/images/doge.jpg')
      click_button('Update User')
      expect(page).to have_content('client management')
      expect(page).to have_xpath("//img[contains(@src,'doge.jpg')]")
    end
end
