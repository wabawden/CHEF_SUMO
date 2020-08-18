class Chef < ApplicationRecord
    belongs_to :user
    has_many :messages
    has_many :bookings
    has_many :reviews, through: :bookings
    validates :description, :cuisine, :location_range, :price, :chef_postcode, presence: :true
    has_one_attached :photo

end
