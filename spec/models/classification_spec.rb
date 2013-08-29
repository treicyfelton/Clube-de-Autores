require 'spec_helper'

describe Classification do

# MIN_AGE	

	it "should not have a blank min_age" do
    classification = FactoryGirl.build(:classification, min_age: '')
    classification.should_not be_valid
  end

  it "should not have a nil min_age" do
    classification = FactoryGirl.build(:classification, min_age: nil)
    classification.should_not be_valid
  end

# NAME

  it "should not have a blank name" do
    classification = FactoryGirl.build(:classification, name: '')
    classification.should_not be_valid
  end

  it "should not have a nil name" do
    classification = FactoryGirl.build(:classification, name: nil)
    classification.should_not be_valid
  end

end
