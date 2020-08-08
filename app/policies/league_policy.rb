class LeaguePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.memberships.where(user: user).any?
  end

  def edit?
    record.memberships.where(user: user, role: 1).any?
  end

  def update?
    record.memberships.where(user: user, role: 1).any?
  end

  def destroy?
    record.memberships.where(user: user, role: [1, 2]).any?
  end
end
