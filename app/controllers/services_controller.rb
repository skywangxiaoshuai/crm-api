class ServicesController < ApplicationController
  before_action :set_services, only: [:edit, :update, :destroy]

  # 返回数据库中所有的服务
  def index
    services = Service.all.order(created_at: :desc)
                      .page(params[:page][:number])
                      .per(params[:page][:size])
    render status: :ok, json: services, EachSerializer: ServiceSerializer,
           meta: pagination_dict(services)
  end

  # 返回一个商铺所使用的所有服务
  # get /stores/:id/services
  def index_services_of_store
    store = Store.find_by(id: params[:id])
    return unless store
    services = store.services.page(params[:page][:number]).per(params[:page][:size])
    render status: :ok, json: services, EachSerializer: ServiceSerializer,
           meta: pagination_dict(services)
  end

  # 添加服务
  # post /services
  def create
    authorize Service
    service = Service.new(service_params)
    if service.save
      render status: :created, json: service
    else
      render status: :unprocessable_entity, json: service,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # get /services/:id
  def edit
    authorize @service
    render status: :ok, json: @service
  end

  # put /services/:id
  def update
    authorize @service
    if @service.update(service_params)
      render status: :ok, json: @service
    else
      render status: :unprocessable_entity, json: service,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  def destroy
    authorize @service
    stores = @service.stores
    if stores.blank? && @service.destroy
      render status: :no_content
    elsif stores.any?
      @service.errors.add(:base, "请注意，有商铺正在使用这项服务！！！")
      render status: :unprocessable_entity, json: @service,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

    def set_services
      @service = Service.find(params[:id])
    end

    def service_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params,
        only: [
          :name, :company_name, :district, :address, :contact,
          :contact_position, :contact_telephone, :contact_otherinfo, :remarks
        ]
      )
    end
end
