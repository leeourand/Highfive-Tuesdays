class Highfive < ActiveRecord::Base
  belongs_to :user1,
             :class_name => "User"
  
  belongs_to :user2,
             :class_name => "User"
end
