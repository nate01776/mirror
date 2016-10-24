class Salonuser < ApplicationRecord
  belongs_to :salon
  belongs_to :user


  validates :user_id, presence: true
  validates :salon_id, presence: true
end
