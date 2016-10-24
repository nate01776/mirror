class Salon < ApplicationRecord
  belongs_to :owner
  has_many :services
  has_many :products
  has_many :salonusers
  has_many :users, through: :salonusers

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, uniqueness: true
  validates :owner_id, presence: true
  validate :belongs_to_owner

  def belongs_to_owner
    creator = User.find(owner_id)
    if creator.user_type != "owner"
      errors.add(:owner, "must be the creator!")
    end
  end

  def owner
    User.find(owner_id)
  end

  def find_stylists(array)
    output = []
    array.each do |user|
      if user.user_type == "stylist"
        output << user
      end
    end
    output
  end

  def find_clients(array)
    output = []
    array.each do |user|
      if user.user_type == "client"
        output << user
      end
    end
    output
  end
end
