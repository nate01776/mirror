require 'rails_helper'

describe 'Service' do
  feature 'should match expected output' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:service_hair) { create(:service, salon_id: salon.id, service_type: "hair") }
    let!(:service_color) { create(:service, salon_id: salon.id, service_type: "color") }
    let!(:service_extensions) { create(:service, salon_id: salon.id, service_type: "extensions") }
    let!(:service_relaxing) { create(:service, salon_id: salon.id, service_type: "relaxing") }
    let!(:service_treatments) { create(:service, salon_id: salon.id, service_type: "treatments") }
    let!(:service_makeup) { create(:service, salon_id: salon.id, service_type: "makeup") }
    let!(:service_style) { create(:service, salon_id: salon.id, service_type: "style") }
    let!(:service_bridal) { create(:service, salon_id: salon.id, service_type: "bridal") }
    let!(:service_other) { create(:service, salon_id: salon.id, service_type: "other") }

    scenario 'should return icon css tags' do
      expect(service_hair.icon).to eq("fa fa-scissors")
      expect(service_color.icon).to eq("fa fa-eyedropper")
      expect(service_extensions.icon).to eq("fa fa-angle-double-down")
      expect(service_relaxing.icon).to eq("fa fa-leaf")
      expect(service_treatments.icon).to eq("fa fa-cog")
      expect(service_makeup.icon).to eq("fa fa-eye")
      expect(service_style.icon).to eq("fa fa-camera-retro")
      expect(service_bridal.icon).to eq("fa fa-heart")
      expect(service_other.icon).to eq("fa fa-dot-circle-o")
    end
  end
end
