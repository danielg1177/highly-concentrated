class ChatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(receiver: user).or(scope.where(sender: user))
    end
  end

  def index
    true if user
  end

  def new
    true if user
  end

  def create
    true if user
  end
end
