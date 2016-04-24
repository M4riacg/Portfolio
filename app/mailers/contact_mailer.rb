class ContactMailer < ApplicationMailer
  default :to => "m4riacg@gmail.com"

  def new_message(message)
    @message = message
    #mail(to: "m4riacg@gmail.com", subject: 'Welcome to My Awesome Site')
    mail(from: @message.email, subject: @message.name, body: @message.body)
  end
end