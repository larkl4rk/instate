class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :default
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :identify, uniqueness: true
  has_many :posts
  has_many :likes
  has_many :comments
  mount_uploader :avatar, AvatarUploader

  has_many :liked_posts, through: :likes, source: :post
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower
  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed

  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end

  def default
    if User.first
      self.followings = [User.first]
    end
  end
end
