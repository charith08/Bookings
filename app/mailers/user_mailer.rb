class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail(
      :subject => 'Hello from Postmark',
      :to  => user.email,
      :from => 'charith@commutatus.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

  def accept_invitation(participant)
    @participant = participant
    mail(
      :subject => 'Invite to a Meeting',
      :to  => @mailuser,
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
