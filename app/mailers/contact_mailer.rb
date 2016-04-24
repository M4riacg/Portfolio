class ContactMailer < ApplicationMailer
  default :to => "m4riacg@gmail.com"
  layout 'mailer'

  def new_message(message)
    @message = message
    mail(to: "m4riacg@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
