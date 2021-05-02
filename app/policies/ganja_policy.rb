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
end
