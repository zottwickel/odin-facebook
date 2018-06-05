class Post < ApplicationRecord

	belongs_to :user
	has_many :comments, as: :commentable	
	default_scope { order(created_at: :desc) }

	validates :user_id, presence: true
	validates :title, presence: true,
										length: { maximum: 100 }
	validates :body, presence: true,
									 length: { maximum: 512 }

end
