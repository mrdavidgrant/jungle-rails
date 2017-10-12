class UserMailerController < ApplicationController
  def order_confirmation
    @order = Order.find(params[:id])
  end
end
