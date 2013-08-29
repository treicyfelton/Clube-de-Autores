require 'test_helper'

class HistoryTest < ActiveSupport::TestCase
  setup do
		@history = histories(:history)
	end

	test "Should be valid without changes" do
		assert @history.valid?
	end

# TITLE

	test "Should not have a blank title" do
		@history.title = ""
    		assert !@history.valid?
    	end

end
