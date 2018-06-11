class MemoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).order(created_at: :desc)
    end
  end

  def show?
    record.user == user
  end

  def new?
    true
  end

  def create?
    true
  end
end
