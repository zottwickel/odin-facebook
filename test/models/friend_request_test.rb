require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase

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
	end

	test "can make friend requests" do
		assert @userone.friend_requests.new(friend_id: @usertwo.id)
	end

	test "can accept friend requests" do
		request = @userone.friend_requests.new(friend_id: @usertwo.id)
		assert request.accept
	end

end
