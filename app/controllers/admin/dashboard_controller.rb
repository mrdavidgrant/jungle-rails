class Admin::DashboardController < ApplicationController


  def show
  end

  before_filter :authenticate

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV['USER_ID'] && password == ENV['PASSWORD']
    end
  end
  
      
end
