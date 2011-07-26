class Highfive < ActiveRecord::Base
  validates_presence_of :user1, :user2
  validate :is_not_a_self_highfive
  validate :is_not_over_highfive_threshold, :on => :create
  belongs_to :user1,
             :class_name => "User"
  
  belongs_to :user2,
             :class_name => "User"
             
  scope :recent, :order => "id desc", :limit => 10
  scope :approved, where(:approved => true)

  def is_not_a_self_highfive
    errors.add(:base, "You can't highfive yourself!") if (self.user1_id == self.user2_id)
  end
  
  def is_not_over_highfive_threshold
    errors.add(:base, "You've already highfived them 3 times today") if User.pair_count(self.user1_id, self.user2_id) > 2
  end
end
