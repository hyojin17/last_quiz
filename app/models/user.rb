class User < ActiveRecord::Base
  has_many :comments
  acts_as_follower
  acts_as_followable
  has_one :profile, dependent: :destroy#프로필은유저가 삭제될때 같이 삭제된다.
  has_many :articles
  has_many :likes
  has_many :l_articles, through: :likes, source: :article
  #l_article를 하면 article들이 튀어나오는데, 좋아요를 통해 그게 실행된다.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
