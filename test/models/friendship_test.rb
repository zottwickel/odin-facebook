require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase

	def setup
		@userone = User.new(name: "Someone Normal",
										 		email: "normal@example.com",
												password: "foobar",
												password_confirmation: "foobar")
		@userone.confirm
		@usertwo = User.new(name: "Someone Abnormal",
												email: "abnormal@example.com",
												password: "foobar",
												password_confirmation: "foobar")
		@usertwo.confirm
		@request = @userone.friend_requests.new(friend_id: @usertwo.id)
	end

	test "can make new friendships" do
		assert Friendship.new(user_id: @userone.id, friend_id: @usertwo.id)
	end
end
