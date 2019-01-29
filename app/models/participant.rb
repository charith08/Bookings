class Participant < ApplicationRecord

  attr_accessor :invitation_token
  before_create :create_invitation_digest
  belongs_to :booking, dependent: :destroy

class << self
def digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end



# Returns a random token.
def new_token
  SecureRandom.urlsafe_base64
end

end


private

    def create_invitation_digest
      self.invitation_token  = Participant.new_token
      self.invitation_digest = Participant.digest(invitation_token)
    end

end
