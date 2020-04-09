# Model methods and validations
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :chirps
  has_many :comments
  has_one_attached :avatar
  has_one_attached :cover

  has_many :followerships, class_name: 'Following', foreign_key: :user_id,
                           dependent: :delete_all
  has_many :inverse_followerships, class_name: 'Following',
                                   foreign_key: :follower_id,
                                   dependent: :delete_all
  has_many :followed_users, through: :inverse_followerships,
                            source: :user
  has_many :followers, through: :followerships,
                       source: :follower

  validates :username, presence: true, length: { minimum: 4, maximum: 20 },
                       uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :full_name, presence: true, length: { minimum: 7, maximum: 50 }
  validates :bio, length: { maximum: 78 }
  validates :email, presence: true, uniqueness: true

  scope :all_but, ->(user) { where.not(id: user) }

  # thows a list of users to follow
  def follow_suggest
    User.all_but(self).map { |usr| usr unless following?(usr) }.compact
  end

  # Checks for followership
  def follower?(user)
    followers.include?(user)
  end

  # Checks for followership
  def following?(user)
    followed_users.include?(user)
  end

  # return chirps
  def user_timeline
    Chirp.includes(:user).where(user: [self] + followed_users).most_recents
  end
end
