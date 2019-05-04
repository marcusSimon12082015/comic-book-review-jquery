class ComicPolicy < ApplicationPolicy
  def create?
    user.present? && user.admin?
  end
end
