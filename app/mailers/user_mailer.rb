class UserMailer < ApplicationMailer
  default from: 'info@theblackandwhites.com.au'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order_confirmation.subject
  #
  def order_confirmation (user, cart, product, customer, pickup)
    @user = user
    @cart = cart
    @product = product
    @customer = customer
    @pickup = pickup

    mail to: user.email, subject: "A new order has been placed"
  end

  def order_cancelation (user, product, customer, list)
    @user = user
    @product = product
    @customer = customer
    @list = list

    mail to: user.email, subject: "Order Cancelled :("
  end
end
