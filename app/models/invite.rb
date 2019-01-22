class Invite < ApplicationRecord
  before_save :check_user_existence
  before_create :generate_token
  belongs_to :meeting
      belongs_to :sender, :class_name => 'User'
      belongs_to :recipient, :class_name => 'User'

      def generate_token
        self.token = Digest::SHA1.hexdigest([self.user_group_id, Time.now, rand].join)
      end

      def check_user_existence
         recipient = User.find_by_email(email)
        if recipient
           self.recipient_id = recipient.id
        end
      end
end
