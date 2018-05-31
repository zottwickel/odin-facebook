require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	def setup
		@user = User.new(name: "Someone Normal",
										 email: "normal@example.com",
										 password: "foobar",
										 password_confirmation: "foobar")
		@user.confirm
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "   "
		assert_not @user.valid?
	end

	test "name should not be longer than 50" do
		@user.name = "x" * 51
		assert_not @user.valid?
	end

	test "email address should not be longer than 254" do
		@user.email = "x" * 243 + "@example.com"
		assert_not @user.valid?
	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "validations should reject invalid emails" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
		                	   foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end

	test "email address should be saved lowecase" do
		mixed_case_email = "tHiSiS@aBaDaDdY.cOm"
		@user.email = mixed_case_email
		@user.save
		@user.confirm
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

	test "password should be present (nonblank)" do
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end

	test "password should have a minimum length" do
		@user.password = @user.password_confirmation = "x" * 5
		assert_not @user.valid?
	end

end
