class EmailerMailer < ApplicationMailer
  default from: 'topbanana909@gmail.com'
  layout 'mailer'
  #
  # def welcome_email(user)
  #   @user = user
  #   @url = 'silvercare.com'
  #   email_with_name =  %("#{@user.first_name}" <#{@user.email}>)
  #   mail(to: email_with_name, subject: "Thanks for signing up with silver care")
  # end
  #
  # def transaction_email(user)
  #   @user = user
  #   email_with_name =  %("#{@user.first_name}" <#{@user.email}>)
  #   mail(to: email_with_name, subject: "You have a new transaction")
  # end
end
