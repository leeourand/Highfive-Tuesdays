class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def unapproved_highfives?
    current_user.unapproved_highfives if current_user
  end
  
  def broadcast(channel, data)
    message = {:channel => channel, :data => data}
    uri = URI.parse("#{faye_uri}/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
  
  def faye_uri
    Rails.configuration.faye_uri
  end
  
  helper_method :current_user, :broadcast, :faye_uri, :unapproved_highfives?
  
  private
  def authenticate
    if current_user.nil?
      redirect_to '/login', :notice => "You must be logged in to view this"
    end
  end
end
