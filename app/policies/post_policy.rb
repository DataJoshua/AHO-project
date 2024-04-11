class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.approved? || owner?
  end

  def new?
    user.region == record || admin?
  end

  def edit?
    owner?
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    (owner? && record.draft?) || (admin? && owner?)
  end

  protected

  def owner?
    record.user == user
  end
end
