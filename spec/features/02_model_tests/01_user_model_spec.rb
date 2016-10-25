require 'rails_helper'

describe 'User' do
  feature 'should match expected output' do
    let!(:user_client) { create(:user) }
    let!(:user_stylist) { create(:user, user_type: 'stylist') }
    let!(:user_owner) { create(:user, user_type: 'owner') }

    scenario 'owner returns true for owner' do
      owner_result = user_owner.is_owner?
      client_result = user_client.is_owner?
      stylist_result = user_stylist.is_owner?

      expect(owner_result).to eq(true)
      expect(client_result).to eq(false)
      expect(stylist_result).to eq(false)
    end

    scenario 'owner returns true for owner' do
      owner_result = user_owner.is_stylist?
      client_result = user_client.is_stylist?
      stylist_result = user_stylist.is_stylist?

      expect(owner_result).to eq(false)
      expect(client_result).to eq(false)
      expect(stylist_result).to eq(true)
    end
  end
end
