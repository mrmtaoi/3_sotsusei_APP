# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    def reminder_email(user)
      @user = user
      mail(to: @user.email, subject: '防災バッグリマインダー')
    end
  end
