=class UserMailer < ApplicationMailer
  default from: 'topbanana909@gmail.com'
  layout 'mailer'

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


  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Email')
  end

  def fammember_transaction_email(user)
    @user = user
    # @caregiveremail = User.find_by(id: Caregiver.find_by(id: params[:caregiver_id]).user_id)
    # recipients = [@user.email, @caregiveremail.email]
    @url = "localhost:3000/login"
    mail(to: @user.email, subject: "You have a new transaction")
  end

  def caregiver_transaction_email(caregiveremail)
    @caregiveremail = caregiveremail
    mail(to: @caregiveremail.email, subject: "You have a new transaction")
  end

end
