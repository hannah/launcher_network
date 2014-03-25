class InterestGroup < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator'
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true
  validates :creator, presence: true
end
