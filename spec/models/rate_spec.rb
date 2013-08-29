require 'spec_helper'

describe Rate do

# HISTORY_ID	

	it "should not have a blank history_id" do
    rate = FactoryGirl.build(:rate, history_id: '')
    rate.should_not be_valid
  end

  it "should not have a nil history_id" do
    rate = FactoryGirl.build(:rate, history_id: nil)
    rate.should_not be_valid
  end

# URATE

	it "should not have a blank urate" do
    rate = FactoryGirl.build(:rate, urate: '')
    rate.should_not be_valid
  end

  it "should not have a nil urate" do
    rate = FactoryGirl.build(:rate, urate: nil)
    rate.should_not be_valid
  end 

# USER_ID 

	it "should not have a blank user_id" do
    rate = FactoryGirl.build(:rate, user_id: '')
    rate.should_not be_valid
  end

  it "should not have a nil user_id" do
    rate = FactoryGirl.build(:rate, user_id: nil)
    rate.should_not be_valid
  end 

# OWNER

	it "should not have a blank owner" do
    rate = FactoryGirl.build(:rate, owner: '')
    rate.should_not be_valid
  end

  it "should not have a nil owner" do
    rate = FactoryGirl.build(:rate, owner: nil)
    rate.should_not be_valid
  end   
end