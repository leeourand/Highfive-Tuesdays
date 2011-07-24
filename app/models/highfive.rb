class Highfive < ActiveRecord::Base
  validates_presence_of :user1, :user2
  validate :is_not_a_self_highfive
  belongs_to :user1,
             :class_name => "User"
  
  belongs_to :user2,
             :class_name => "User"
             
  scope :recent, :order => "id desc", :limit => 10
  scope :approved, where(:approved => true)

  def is_not_a_self_highfive
    errors.add(:base, "You can't highfive yourself!") if (self.user1_id == self.user2_id)
  end
end
