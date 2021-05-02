class PurchaseRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    true if user
  end

  def accept?
    true
  end
end
