class UserSerializer < ActiveModel::Serializer
  attributes :name, :role

  def role
    object.roles.pluck(:name)
  end
end
