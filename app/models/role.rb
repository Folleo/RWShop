class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :user, :through => :user_roles

  ADMIN = 'Admin'
  USER = 'User'

end
