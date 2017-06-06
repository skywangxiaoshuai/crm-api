class ServicePolicy < ApplicationPolicy

  # def index?
  #   user.has_role?(:super_admin)
  # end

  def create?
    user.has_role?(:super_admin)
  end

  def edit?
    user.has_role?(:super_admin)
  end

  def update?
    user.has_role?(:super_admin)
  end

  def destroy?
    user.has_role?(:super_admin)
  end

end
