class PickPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    league.memberships.where(user: user).any?
  end

  private

  def league
    record&.game_week.season.league
  end
end
