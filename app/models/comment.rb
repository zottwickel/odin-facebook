class Comment < ApplicationRecord

	belongs_to :commentable, polymorphic: true
	has_many :comments, as: :commentable

	validates :content, presence: true
	validates :content, length: { maximum: 140 }

end
