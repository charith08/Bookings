class Booking < ApplicationRecord

  belongs_to :user
    belongs_to :room

    has_many :users, through: :bookings
    has_many :invites




end
