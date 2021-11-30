class RunPolicy < ApplicationPolicy
  def index?
    user&.role&.read_runs?
  end

  def show?
    user&.role&.read_runs?
  end

  def create?
    user&.role&.create_runs?
  end

  def update?
    user&.role&.update_runs?
  end

  def destroy?
    user&.role&.delete_runs?
  end
end