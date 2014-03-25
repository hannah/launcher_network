class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :user, presence: true
  validates :body, presence: true, length: {maximum: 500}

  def self.favorite
    order("comments_count DESC").limit(1).take
  end
end
