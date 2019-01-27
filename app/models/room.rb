class Room < ApplicationRecord
  has_many :bookings

  validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}
    validates :capacity, presence: true
end
