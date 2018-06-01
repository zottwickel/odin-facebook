class FriendRequest < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	validates :user,   presence: true
	validates :friend, presence: true,
										 uniqueness: { scope: :user }

	def accept
		user.friends << friend
		self.destroy
	end

	def update
		@friend_request.accept
		head :no_content
	end

end
