class CooperationSerializer < ActiveModel::Serializer
  attributes :start_date, :status, :remarks, :service_name, :service_id

  def service_name
  	Service.find_by(id: object.service_id).try(:name)
  end

  def service_id
  	object.service_id
  end

end
