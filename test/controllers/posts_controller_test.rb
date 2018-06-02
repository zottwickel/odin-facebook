require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.new(name: "Someone Normal",
										 email: "normal@example.com",
										 password: "foobar",
										 password_confirmation: "foobar")
		@user.confirm
	end


end
