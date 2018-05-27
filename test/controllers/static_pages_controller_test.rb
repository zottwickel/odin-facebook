require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	test "Loads static pages" do
		get root_path
		assert_response :success
	end

end
