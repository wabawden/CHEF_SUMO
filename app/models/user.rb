class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :messages
  has_one :chef, dependent: :destroy
  has_one_attached :photo
  validates :first_name, :last_name, :phone_number, :address, :postcode, presence: :true
end
