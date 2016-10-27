class Clientservice < ApplicationRecord
  belongs_to :stylistservice
  belongs_to :user

  validates :stylistservice_id, presence: true
  validates :user_id, presence: true

  def stylist
    User.find(Stylistservice.find(self.stylistservice_id).user_id)
  end

  def service
    Service.find(Stylistservice.find(self.stylistservice_id).service_id)
  end

  def client
    User.find(self.user_id)
  end
end
