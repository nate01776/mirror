class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :salonusers
  has_many :salons, through: :salonusers
  has_many :stylistservices
  has_many :services, through: :stylistservices

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, uniqueness: true

  def is_owner?
    user_type == "owner"
  end

  def is_stylist?
    user_type == "stylist"
  end

  def is_client?
    user_type = "client"
  end

  def full_name
    first_name + " " + last_name
  end

  def recent_salon
    salons.last
  end

  def default_image
    "https://s3.amazonaws.com/mirrorimages/uploads/user/image/default/stock-photo-curly-blonde-hair-closeup-wavy-blond-hair-background-close-up-texture-of-permed-hair-hairstyle-197410298.jpg"
  end
end
