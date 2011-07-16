class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def broadcast(channel, data)
    message = {:channel => channel, :data => data}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
  
  helper_method :current_user, :broadcast
  
  private
  def authenticate
    if current_user.nil?
      redirect_to '/login', :notice => "You must be logged in to view this"
    end
  end
end
