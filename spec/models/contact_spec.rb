require 'spec_helper'

describe Contact do

# CTYPE

	it "should not have a blank ctype" do
    contact = FactoryGirl.build(:contact, ctype: '')
    contact.should_not be_valid
  end

  it "should not have a nil ctype" do
    contact = FactoryGirl.build(:contact, ctype: nil)
    contact.should_not be_valid
  end

# SUBJECT

  it "should not have a blank subject" do
    contact = FactoryGirl.build(:contact, subject: '')
    contact.should_not be_valid
  end

  it "should not have a nil subject" do
    contact = FactoryGirl.build(:contact, subject: nil)
    contact.should_not be_valid
  end

# EMAIL

  it "should not have a blank cemail" do
    contact = FactoryGirl.build(:contact, cemail: '')
    contact.should_not be_valid
  end

  it "should not have a nil cemail" do
    contact = FactoryGirl.build(:contact, cemail: nil)
    contact.should_not be_valid
  end

  it "should not have an invalid cemail" do
    contact = FactoryGirl.build(:contact, cemail: 'foo@bar')
    contact.should_not be_valid
  end

# LINK

  it "should have an empty link" do
    contact = FactoryGirl.build(:contact, link: '')
    contact.should be_valid
  end

# MESSAGE

  it "should not have a blank message" do
    contact = FactoryGirl.build(:contact, message: '')
    contact.should_not be_valid
  end

  it "should not have a nil message" do
    contact = FactoryGirl.build(:contact, message: nil)
    contact.should_not be_valid
  end
end
