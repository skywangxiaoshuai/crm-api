class TradeSerializer < ActiveModel::Serializer
  attributes :service_name, :store_name, :date, :trade_num, :trade_sum

  def service_name
    Service.find_by(id: object.service_id).name
  end

  def store_name
    Store.find_by(id: object.store_id).name
  end
end
