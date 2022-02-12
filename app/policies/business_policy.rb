class BusinessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def destroy?
      return true
    end

    def update?
      return true
    end
  end
end
