# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  protected

  def admin?
    user.has_role?(:admin)
  end
end
