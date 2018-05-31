require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
	#put some tests here
	test "tests should work" do
		assert 1
	end

	test "should get homepage" do
		get root_path
		assert_response :success
	end

end
