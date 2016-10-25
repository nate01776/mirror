require 'rails_helper'

describe 'Product' do
  feature 'should match expected output' do
    let!(:user_owner) { create(:user, user_type: 'owner') }
    let!(:salon) { create(:salon, owner_id: user_owner.id) }
    let!(:product_hair) { create(:product, salon_id: salon.id, service_type: "hair") }
    let!(:product_color) { create(:product, salon_id: salon.id, service_type: "color") }
    let!(:product_extensions) { create(:product, salon_id: salon.id, service_type: "extensions") }
    let!(:product_relaxing) { create(:product, salon_id: salon.id, service_type: "relaxing") }
    let!(:product_treatments) { create(:product, salon_id: salon.id, service_type: "treatments") }
    let!(:product_makeup) { create(:product, salon_id: salon.id, service_type: "makeup") }
    let!(:product_style) { create(:product, salon_id: salon.id, service_type: "style") }
    let!(:product_bridal) { create(:product, salon_id: salon.id, service_type: "bridal") }
    let!(:product_other) { create(:product, salon_id: salon.id, service_type: "other", in_stock: true) }

    scenario 'should return icon css tags' do
      expect(product_hair.icon).to eq("fa fa-scissors")
      expect(product_color.icon).to eq("fa fa-eyedropper")
      expect(product_extensions.icon).to eq("fa fa-angle-double-down")
      expect(product_relaxing.icon).to eq("fa fa-leaf")
      expect(product_treatments.icon).to eq("fa fa-cog")
      expect(product_makeup.icon).to eq("fa fa-eye")
      expect(product_style.icon).to eq("fa fa-camera-retro")
      expect(product_bridal.icon).to eq("fa fa-heart")
      expect(product_other.icon).to eq("fa fa-dot-circle-o")
      expect(product_other.in_stock_icon).to eq("fa fa-check-square-o")
    end
  end
end
