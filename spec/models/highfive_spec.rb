require 'spec_helper'

describe Highfive do
  describe "#is_not_over_highfive_threshold" do
    let(:user) { Factory(:user) }
    let(:user2) { Factory(:user) }
    
    it "doesn't let a user highfive the same person 4 times" do
      3.times do
        h = Highfive.new
        h.user1_id = user.id
        h.user2_id = user2.id
        h.save
      end
      h = Highfive.new
      h.user1_id= user.id
      h.user2_id = user2.id
      h.save.should eq(nil)
    end
  end
end