class Service < ApplicationRecord
  belongs_to :salon
  has_many :products
  has_many :stylists

  validates :name, presence: true
  validates :description, presence: true
end
