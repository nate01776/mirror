class Clientservice < ApplicationRecord
  belongs_to :salon
  belongs_to :service
  belongs_to :user

  validates :service_id, presence: true
  validates :stylist_id, presence: true
  validates :user_id, presence: true

  def stylist
    User.find(stylist_id)
  end

  def service
    Service.find(service_id)
  end

  def salon
    Salon.find(service.salon_id)
  end

  def client
    User.find(user_id)
  end
end
