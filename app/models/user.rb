class User < ApplicationRecord
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
end
