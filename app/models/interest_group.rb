class InterestGroup < ActiveRecord::Base
  validates :name, presence: true
  validates :creator, presence: true
end
