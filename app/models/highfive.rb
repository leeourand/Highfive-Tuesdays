class Highfive < ActiveRecord::Base
  validates_presence_of :user1, :user2
  belongs_to :user1,
             :class_name => "User"
  
  belongs_to :user2,
             :class_name => "User"
             
  scope :recent, :order => "id desc", :limit => 10
  scope :approved, where(:approved => true)
end
