class Article < ApplicationRecord
  belongs_to :user
  acts_as_commentable
  has_many :likes
  has_many :l_users, through: :likes, source: :user
  validates :title, presence: true, length: {minimum: 3, maximum: 100}
  validates :content, presence: true, length: {minimum: 2}
end
