require 'spec_helper'

describe Favorite do

# HISTORY_ID	

	it "should not have a blank history_id" do
    favorite = FactoryGirl.build(:favorite, history_id: '')
    favorite.should_not be_valid
  end

  it "should not have a nil history_id" do
    favorite = FactoryGirl.build(:favorite, history_id: nil)
    favorite.should_not be_valid
  end

# USER_ID

  it "should not have a blank user_id" do
    favorite = FactoryGirl.build(:favorite, user_id: '')
    favorite.should_not be_valid
  end

  it "should not have a nil user_id" do
    favorite = FactoryGirl.build(:favorite, user_id: nil)
    favorite.should_not be_valid
  end

end