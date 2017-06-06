class UserPolicy < ApplicationPolicy

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

  def reset_password?
    user.id == record.id
  end

  def init_password?
    user.has_role?(:super_admin)
  end

end
