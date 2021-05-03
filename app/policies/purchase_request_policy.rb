class PurchaseRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def seller_options?
    true if user
  end

  def dashboard?
    true if user
  end

  def accept?
    true
  end

  def decline?
    true
  end

  def new?
    true if user
  end

  def create?
    new?
  end
end
