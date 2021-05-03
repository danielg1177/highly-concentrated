class PurchaseRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def seller_options?
    true if user
  end

  def accept?
    true
  end

  def decline?
    true
  end
end
