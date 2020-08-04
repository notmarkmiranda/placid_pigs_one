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
    admin_or_super?
  end

  def create?
    admin_or_super?
  end

  def edit?
    league.memberships.where(user: user, role: 1).any?
  end

  def update?
    admin_or_super?
  end

  def destroy?
    admin_or_super?
  end

  private

  def league
    record&.league
  end

  def admin_or_super?
    league.memberships.where(user: user, role: [1, 2]).any?
  end
end
