class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, :through => :user_roles

  def role?(role)
    role_names.include? role
  end

  def role_names
    @role_names ||= self.roles.map(&:name)
  end

  def role=(role)
    self.roles << Role.find_or_create_by_name(role)
  end

end
