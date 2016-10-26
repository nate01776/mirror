class Clientservice < ApplicationRecord
  belongs_to :stylistservice
  belongs_to :user

  validates :stylistservice_id, presence: true
  validates :user_id, presence: true
end
