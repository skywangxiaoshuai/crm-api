class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  skip_before_action :current_user

  # 模糊查询商铺
  # get /stores/search?q=华为
  def search_store_by_name
    stores = Store.ransack(name_cont: params[:q]).result
    render status: :ok, json: stores, each_serializer: StoreBasicSerializer
  end

  # 筛选商铺
  # get /stores?code=11&name=11&block_id=1&developer_id=1&operator_id=1&page[number]=1
  # TODO 多条件查询
  def search_store_by_multiple_params
    # binding.pry
    ransack_params = {}
    ransack_params[:code_cont] = params[:code] if params[:code].present?
    ransack_params[:name_cont] = params[:name] if params[:name].present?

    if params[:developer_id].present?
      ransack_params[:developer_id_eq] = params[:developer_id].to_i
    end

    if params[:operator_id].present?
      ransack_params[:operator_id_eq] = params[:operator_id].to_i
    end

    if params[:block_id].present?
      ransack_params[:block_id_eq] = params[:block_id].to_i
    end

    ransack_params[:store_district] = params[:store_district]
    ransack_params[:store_category] = params[:store_category]

    stores = Store.search(ransack_params).result
             .page(params[:page][:number]).per(params[:page][:size])
    render status: :ok, json: stores,
           each_serializer: StoreSerializer, meta: pagination_dict(stores)
  end

  # 查看商铺信息
  # get /stores/:id
  def show
    render status: :ok, json: @store, Serializer: StoreSerializer
  end

  # 创建商铺
  def create
    # params = store_params
    # params[:town_id] = Block.town_id(params[:block_id])
    store = Store.new(store_params)
    if store.save
      render status: :created, json: store, Serializer: StoreSerializer
    else
      render status: :unprocessable_entity, json: store,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 编辑商铺
  def edit
    render status: :created, json: @store, Serializer: StoreSerializer
  end

  # 更新商铺
  def update
    # params = store_params
    # params[:town_id] = Block.town_id(params[:block_id])
    if @store.update(store_params)
      render status: :ok, json: @store, Serializer: StoreSerializer
    else
      render status: :unprocessable_entity, json: @store,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 删除商铺
  def destroy
    @store.destroy
    render status: :no_content
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params,
        only: [
          :name, :developer_id, :operator_id, :block_id, :district, :category,
          :address, :contact, :contact_position, :contact_telephone, :remarks,
          :enterprise_id, :contact_otherinfo, :code, :product
        ]
      )
    end
end
