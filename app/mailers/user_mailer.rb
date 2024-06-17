# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    default from: 'no-reply.lpmp@gmail.com'
    
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Bienvenue sur Le Petit Monde en Plastique')
    end
    
    def order_confirmation(order)
      @order = order
      @user = @order.user
      mail(to: @user.email, subject: 'Confirmation de commande')
    end
  end
  