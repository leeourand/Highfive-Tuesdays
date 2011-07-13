class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  
  def highfives
    Highfive.where("user1_id = ? or user2_id = ?", id, id)
  end
  
  def self.leaders
    users = User.all
    users.sort! { |a,b| b.highfives.count <=> a.highfives.count}
  end
  
end
