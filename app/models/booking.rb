class Booking < ApplicationRecord

  belongs_to :room
  has_many :participants
  validates :name, presence: true, length: {maximum: 30}
  validates :start_time, presence: true
  validates :end_time, presence: true, if: :valide



  def valide
    (!end_time.nil? && end_time.to_time.hour<=20) ? true : errors.add(:end_time)
  end



end
