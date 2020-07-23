class SeasonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    league.memberships.where(user: user).any?
  end

  def new?
    league.memberships.where(user: user, role: 1).any?
  end

  def create?
    league.memberships.where(user: user, role: 1).any?
  end

  def edit?
    league.memberships.where(user: user, role: 1).any?
  end

  def update?
    league.memberships.where(user: user, role: 1).any?
  end

  def destroy?
    league.memberships.where(user: user, role: 1).any?
  end

  private

  def league
    record&.league
  end
end
