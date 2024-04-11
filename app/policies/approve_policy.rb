class ApprovePolicy < ApplicationPolicy
  def create?
    admin? && record.under_review?
  end
end
