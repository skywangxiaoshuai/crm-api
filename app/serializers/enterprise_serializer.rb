class EnterpriseSerializer < ActiveModel::Serializer
  attributes :name, :developer, :operator, :district, :address, :contact,
    :contact_position, :contact_telephone,  :contact_otherinfo, :remarks,
    :pictures, :store_count, :code

  def operator
    user = User.find_by(id: object.operator_id)
    user.attributes.extract!("id", "name") if user
  end

  def developer
    user = User.find_by(id: object.developer_id)
    user.attributes.extract!("id", "name") if user
  end

  def pictures
    object.pictures.map do |picture|
      hash = { id: picture.id, url: picture.picture}
    end
  end

  def store_count
    object.stores.count
  end
end
