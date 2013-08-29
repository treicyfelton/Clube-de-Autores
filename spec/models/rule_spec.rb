require 'spec_helper'

describe Rule do

	it "should not have a blank uprules" do
    rule = FactoryGirl.build(:rule, uprules: '')
    rule.should_not be_valid
  end

  it "should not have a nil uprules" do
    rule = FactoryGirl.build(:rule, uprules: nil)
    rule.should_not be_valid
  end
end
