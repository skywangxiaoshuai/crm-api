class BlockSerializer < ActiveModel::Serializer
  attributes :code, :name, :description, :developer, :operator, :district

  def developer
    user = User.find_by(id: object.developer_id)
    user.attributes.extract!("id", "name") if user
  end

  def operator
    user = User.find_by(id: object.operator_id)
    user.attributes.extract!("id", "name") if user
  end

end
