# TEST
require 'spec_helper'


describe User do
  
let(:user) do
  user = FactoryGirl.create(:user)
end

# NAME

  it "should not have a blank name" do
    user = FactoryGirl.build(:user, name: '')
    user.should_not be_valid
  end

  it "should not have a nil name" do
    user = FactoryGirl.build(:user, name: nil)
    user.should_not be_valid
  end

  it "should not have an invalid name" do
  	user = FactoryGirl.build(:user, name: 'nome 123,')
  	user.should_not be_valid
  end

# EMAIL

  it "should not have an invalid email" do
   	user = FactoryGirl.build(:user, email: 'foo@bar')
   	user.should_not be_valid
  end

  it "should not have an empty email" do
    user = FactoryGirl.build(:user, email: '')
    user.should_not be_valid
  end

  it "should not have a nil email" do
    user = FactoryGirl.build(:user, email: nil)
    user.should_not be_valid
  end

  it "should not repeat email" do
    user = FactoryGirl.build(:user, email: "email@email.com")
    new_user = FactoryGirl.build(:user, email: "email2@email.com")
    new_user.should_not be_valid if user.email == new_user.email
  end 

# NICK

  it "should not have an invalid nick" do
	  user = FactoryGirl.build(:user, nick: 'tre#123.')
	  user.should_not be_valid
  end

  it "should not have a blank nick" do
    user = FactoryGirl.build(:user, nick: '')
    user.should_not be_valid
  end

  it "should not have a nil nick" do
    user = FactoryGirl.build(:user, nick: nil)
    user.should_not be_valid
  end

  it "should not repeat nick" do
  	user = FactoryGirl.create(:user, nick: 'mynick')
  	new_user = FactoryGirl.build(:user, nick: 'mynick')
  	user.should be_valid
  	new_user.should_not be_valid(:nick)
  end

# PASSWORD

  it "should return the correct encrypted password" do
    user = FactoryGirl.build(:user, password: Digest::SHA1.hexdigest('abc_123456_123'))
    password = User.encrypt_password('123456')
    user.password.should eq password
  end

  it "should have the password plain text" do
    user = FactoryGirl.build(:user)
    user.should respond_to :plain_password=
  end

  it "should have attribute to return empty password" do
    FactoryGirl.build(:user, plain_password: '').should be_valid
  end

  it "should save the encrypt password in password" do
    user = FactoryGirl.build(:user, plain_password: '123456')
    user.password.should eq User.encrypt_password('123456')
  end

# SITUATION

  it "should have an empty situation" do
  	user = FactoryGirl.build(:user, situation: '')
  	user.should be_valid
  end


# HOBBY

  it "should have an empty hobby" do
  	user = FactoryGirl.build(:user, hobby: '')
  	user.should be_valid
  end

  

end