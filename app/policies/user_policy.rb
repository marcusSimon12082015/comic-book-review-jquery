class UserPolicy < ApplicationPolicy
  def show?
    user.present? && (user.admin? || user.id == record.id)
  end
end
