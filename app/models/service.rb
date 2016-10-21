class Service < ApplicationRecord
  belongs_to :salon
  has_many :products
  has_many :stylists

  validates :name, presence: true
  validates :description, presence: true

  def icon
    if service_type == "cut"
      "fa fa-scissors fa-2x"
    elsif service_type == "color"
      "fa fa-tint fa-2x"
    end
  end
end
