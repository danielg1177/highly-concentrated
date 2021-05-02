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

  def dashboard?
    true if user
  end
end
