class Stylistservice < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :service_id, presence: true
  validates :user_id, presence: true
end
