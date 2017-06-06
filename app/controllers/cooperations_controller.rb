class CooperationsController < ApplicationController

  before_action :set_store, only: [:index, :create]
  before_action :set_cooperation, only: [:edit, :update, :destroy]

  # 返回一个商铺所有的服务关系表
  # get /stores/:id/cooperations
  def index
    cooperations = @store.cooperations.page(params[:page][:number]).per(params[:page][:size])
    render status: :ok, json: cooperations,
           EachSerializer: CooperationSerializer,
           meta: pagination_dict(cooperations)
  end

  # 创建商铺与服务之间的关系
  # post /stores/:id/cooperations
  def create
    cooperation = @store.cooperations.new(cooperation_params)
    # 如果该商铺已经添加过相同的服务，就不能再次添加
    flag = @store.cooperations.pluck(:service_id).include?(cooperation.service_id)
    if flag
      cooperation.errors.add(:base, "该商铺已经在使用同样的服务，请不要重复添加！！！")
      return render status: :unprocessable_entity, json: cooperation,
                    serializer: ActiveModel::Serializer::ErrorSerializer
    end

    if cooperation.save
      render status: :created, json: cooperation
    else
      render status: :unprocessable_entity, json: cooperation,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # get /cooperations/:id/edit
  def edit
    render status: :ok, json: @cooperation
  end

  # put /cooperations/:id
  def update
    if @cooperation.update(cooperation_params)
      render status: :ok, json: @cooperation
    else
      render status: :unprocessable_entity, json: @cooperation,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 删除商铺与服务之间的关系
  # delete /cooperations/:id
  def destroy
    @cooperation.delete
    render status: :no_content
  end

  private

    def cooperation_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params, only: [:service_id, :start_date,:status, :remarks]
      )
    end

    def set_store
      @store = Store.find(params[:id])
    end

    def set_cooperation
      # @cooperation = Cooperation.where("store_id = ? and service_id = ?", params[:store_id], params[:service_id]).take
      @cooperation = Cooperation.find(params[:id])
    rescue => ex
      render json: { error: e.message }, status: :not_found
    end
end
