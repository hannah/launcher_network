class User < ActiveRecord::Base
  has_many :posts
  has_many :memberships
  has_many :interest_groups, through: :memberships

  ROLES = ["Experience Engineer", "Launcher"]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\Z/}
  validates :role, inclusion: {in: ROLES, message: "must be an Experience Engineer or Launcher"}
end
