require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = User.new(name: "Someone Normal",
										 email: "normal@example.com",
										 password: "foobar",
										 password_confirmation: "foobar")
		@user.confirm
	end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
  end

end
