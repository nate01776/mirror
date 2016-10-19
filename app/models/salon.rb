class Salon < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, uniqueness: true
  validates :user_id, presence: true
  validate :belongs_to_owner

  def belongs_to_owner
    creator = User.find(user_id)
    if creator.user_type != "owner"
      errors.add(:owner, "must be the creator!")
    end
  end
end
