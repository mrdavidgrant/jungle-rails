class UserMailer < ApplicationMailer

  def order_confirmation(order)
    @order = order
    @line_items = order.line_items
    puts "#{order.email}"
    mail(to: order.email, subject: "Confirmation for Order # #{order.id}")
  end

end
