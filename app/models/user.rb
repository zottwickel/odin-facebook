class User < ApplicationRecord

	has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  before_save { self.email.downcase! }

  validates :name, presence: true,
  								 length: { maximum: 50 }

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
  									presence: true,
  									length: { maximum: 254 },
  									uniqueness: { case_sensitive: false }

  def remove_friend(friend)
  	current_user.friends.destroy(friend)
  end
  
end
