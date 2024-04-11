class SendReviewPolicy < ApplicationPolicy
  def create?
    user.has_role?(:user) && record.draft?
  end
end
