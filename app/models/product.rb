class Product < ApplicationRecord
  belongs_to :salon
  has_many :services
  has_many :stylists

  validates :name, presence: true
  validates :description, presence: true

  SERVICE_TYPES = [
    ['hair', 'hair'],
    ['color', 'color'],
    ['extensions', 'extensions'],
    ['relaxing', 'relaxing'],
    ['treatments', 'treatments'],
    ['makeup', 'makeup'],
    ['style', 'style'],
    ['bridal', 'bridal'],
    ['other', 'other']
  ]

  def icon
    if service_type == "hair"
      "fa fa-scissors"
    elsif service_type == "color"
      "fa fa-eyedropper"
    elsif service_type == "extensions"
      "fa fa-angle-double-down"
    elsif service_type == "relaxing"
      "fa fa-leaf"
    elsif service_type == "treatments"
      "fa fa-cog"
    elsif service_type == "makeup"
      "fa fa-eye"
    elsif service_type == "style"
      "fa fa-camera-retro"
    elsif service_type == "bridal"
      "fa fa-heart"
    else
      "fa fa-dot-circle-o"
    end
  end
end
