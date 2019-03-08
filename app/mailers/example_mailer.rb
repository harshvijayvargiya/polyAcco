class ExampleMailer < ApplicationMailer
   default from: 'greatim56@gmail.com'

  def welcome_email user
    @user = user
    @url = ' http://localhost:3000/users/new '
    mail to: @user.email, subject: "It's only confirmation mail"
  end  
end
