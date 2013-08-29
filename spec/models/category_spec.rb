require 'spec_helper'

describe Category do

	it "should not have a blank addcategory" do
    category = FactoryGirl.build(:category, addcategory: '')
    category.should_not be_valid
  end	

  it "should not have a nil addcategory" do
    category = FactoryGirl.build(:category, addcategory: nil)
    category.should_not be_valid
  end	

  it "should not have a addcategory larger than 30" do
    newcategory = FactoryGirl.build(:category, addcategory: '*'*31)
    newcategory.should_not be_valid
 	end
end
