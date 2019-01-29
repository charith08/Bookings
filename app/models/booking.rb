class Booking < ApplicationRecord

  belongs_to :room
  has_many :participants
  validates :name, presence: true, length: {maximum: 30}
  validates :start_time, presence: true, if: :valids
  validates :end_time, presence: true, if: :valide


  def valids
    if (start_time < Time.current || start_time.to_time.hour<9 )
      errors.add(:start_time)
    end
  end



  def valide
    (!end_time.nil? && end_time.to_time.hour<=20) ? true : errors.add(:end_time)
    if (end_time.to_time < start_time.to_time + 1800)
      errors.add(:end_time, "should be greater or equal to 30min")
    end
  end




end
