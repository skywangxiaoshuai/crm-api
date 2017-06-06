class ServiceSerializer < ActiveModel::Serializer
  attributes :name, :company_name, :district, :contact, :contact_position,
             :contact_telephone, :contact_otherinfo, :remarks
end
