class Participant < ApplicationRecord

  belongs_to :booking, dependent: :destroy
  
end
