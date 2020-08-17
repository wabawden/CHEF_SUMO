class Booking < ApplicationRecord
  belongs_to :chef
  belongs_to :user
  has_one :review
  validates :chef_id, :user_id, :price, :date, presence: :true
end
