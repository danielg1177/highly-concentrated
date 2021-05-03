class GanjaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def flower?
    true
  end

  def edible?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end
