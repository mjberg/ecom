class ApplicationController < ActionController::Base
  before_action :authorize

  #the before_action causes the autorize method to be invoked before every action in our applicaiton! 

  protected

  #putting methods in the protected area prevents them from ever being exposed to users as an action!

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "please login"
    end
  end
end
