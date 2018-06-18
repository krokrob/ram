class MemoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).order(created_at: :desc)
    end
  end

  def show?
    record.user == user || user_has_sharing?
  end

  def new?
    true
  end

  def create?
    true
  end

  private

  def user_has_sharing?
    user.sharings.where(memory: record, token: record.token).any?
  end
end
