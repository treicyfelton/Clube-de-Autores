# encoding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
	setup do
		@user = users(:admin)
	end

	test "Should be valid without changes" do
		assert @user.valid?
	end

# NAME

	test "Should not have a blank name" do
		@user.name = ""
    	assert !@user.valid?
    end

    test "Should not have a nil name" do
    	@user.name = nil
    	assert !@user.valid?
  	end

  	test "Should not have an invalid name" do
  		@user.name = "nome 123,"
  		assert !@user.valid?
  	end

# EMAIL

	test "Should not have an invalid email" do
    	@user.email = "foo@bar"
    	assert !@user.valid?
  	end

  	test "Should not have an empty email" do
    	@user.email = ""
    	assert !@user.valid?
  	end

	test "Should not repeat email" do
    	@user 			= users(:admin)
    	new_user        = User.new
    	new_user.email  = @user.email
    	assert !new_user.valid?
  	end

# NICK

	test "Should not have an invalid nick" do
		@user.nick = "tre#123."
		assert !@user.valid?
	end

	test "Should not have an empty nick" do
    	@user.nick = ""
    	assert !@user.valid?
  	end

  	test "Should not repeat nick" do
    	@user 			= users(:admin)
    	new_user        = User.new
    	new_user.nick  = @user.nick
    	assert !new_user.valid?
  	end

# SITUATION

	test "Should have an empty situation" do
		@user.situation = ""
    	assert @user.valid?
	end

# HOBBY

	test "Should have an empty hobby" do
		@user.hobby = ""
		assert @user.valid?
	end

 # test "the truth" do
  #   assert true
  # end
end
