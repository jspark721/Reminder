class ListPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope

    end
  end

  def update?
    user.present? && record.user.present? && (record.user == user || record.open?)
  end

  def destroy?
    update?
  end

end
