# TEST
require 'spec_helper'
	
describe History do  
  	
# TITLE

	it "should not have a blank title" do
    history = FactoryGirl.build(:history, title: '')
    history.should_not be_valid
  end

  it "should not have a nil title" do
    history = FactoryGirl.build(:history, title: nil)
    history.should_not be_valid
  end

  it "should not have a title larger than 70" do
    history = FactoryGirl.build(:history, title: '*'*71)
    history.should_not be_valid
 	end

# DESCRIPTION

  it "should have an empty description" do
  	history = FactoryGirl.build(:history, description: '')
  	history.should be_valid
  end

# NOTE

 	it "should have an empty note" do
  	history = FactoryGirl.build(:history, note: '')
  	history.should be_valid
  end

# AHISTORY
 
 	it "should not have a blank ahistory" do
    history = FactoryGirl.build(:history, ahistory: '')
    history.should_not be_valid
  end	

  it "should not have a nil ahistory" do
    history = FactoryGirl.build(:history, ahistory: nil)
    history.should_not be_valid
  end

  context "rating" do
    it "should have a method to rate it" do
      history = FactoryGirl.build(:history)
      history.should respond_to :rate 
    end

    it "should insert a new rating" do
      user    = FactoryGirl.create(:user)
      history = FactoryGirl.create(:history)
      expect{history.rate(user.id,10)}.to change{Rate.count}.by(1)
    end
  end

  context "favorite" do
    it "should have a method to favorite it" do
      history = FactoryGirl.build(:history)
      history.should respond_to :favorite 
    end

    it "should insert a new favorite" do
      user    = FactoryGirl.create(:user)
      history = FactoryGirl.create(:history)
      expect{history.favorite(user.id)}.to change{Favorite.count}.by(1)
    end
  end
end
