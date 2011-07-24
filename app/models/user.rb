class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :username
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  def highfives
    Highfive.where("(user1_id = ? or user2_id = ?) and approved is not null", id, id)
  end
  
  def unapproved_highfives
    Highfive.where("user2_id = ? and approved is null", id)
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = (SecureRandom.random_number * 100000000000000000).to_i
    end while User.exists?(column => self[column])
  end
  
  def self.leaders
    users = User.all
    users.sort! { |a,b| b.highfives.count <=> a.highfives.count}
  end
  
  def self.highfiveable(current_user)
    users = User.where("id != ?", current_user.id)
  end
  
end
