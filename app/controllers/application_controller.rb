class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  private
  def authenticate
    if current_user.nil?
      redirect_to '/login', :notice => "You must be logged in to view this"
    end
  end
end
