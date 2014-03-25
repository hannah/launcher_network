class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest_group

  validates :user, presence: true
  validates :interest_group, presence: true
end
