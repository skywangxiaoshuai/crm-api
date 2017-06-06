class EnterprisesController < ApplicationController
  before_action :set_ent, only: [:show, :edit, :update, :destroy]
  # skip_before_action :current_user

  # 模糊查询企业
  # get /enterprises?code=111&name=华为&developer_id=1&operator_id=1&page[:number]=1
  # TODO 查询优化，n+1
  def search_ent_by_name_code_developer_operator
    ransack_params = {}
    ransack_params[:code_cont] = params[:code] unless params[:code].empty?
    ransack_params[:name_cont] = params[:name] unless params[:name].empty?
    ransack_params[:developer_id_eq] = params[:developer_id].to_i unless params[:developer_id].empty?
    ransack_params[:operator_id_eq] = params[:operator_id].to_i unless params[:operator_id].empty?
    # 如果ransack_params为空，ransack方法会返回所有的企业
    ents = Enterprise.ransack(ransack_params).result
                     .page(params[:page][:number]).per(params[:page][:size])
    render status: :ok, json: ents, each_serializer: EnterpriseSerializer,
           meta: pagination_dict(ents)
  end

  # 模糊查询企业
  # get /enterprises/search?q=华为
  def search_ent_by_name
    ents = Enterprise.ransack(name_cont: params[:q]).result
    render status: :ok, json: ents, each_serializer: EnterpriseBasicSerializer
  end

  # 查看企业信息
  # get /enterprises/:id
  def show
    render status: :ok, json: @ent, Serializer: EnterpriseSerializer
  end

  # 创建企业
  # post /enterprises
  def create
    ent = Enterprise.new(ent_params)
    if ent.save
      render status: :created, json: ent, Serializer: EnterpriseSerializer
    else
      render status: :unprocessable_entity, json: ent,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 编辑企业
  # get /enterprises/:id/edit
  def edit
    render status: :created, json: @ent, Serializer: EnterpriseSerializer
  end

  # 更新企业
  # put /enterprises/:id
  def update
    if @ent.update(ent_params)
      render status: :ok, json: @ent, Serializer: EnterpriseSerializer
    else
      render status: :unprocessable_entity, json: @ent,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 删除企业
  # delete /enterprises/:id
  def destroy
    @ent.destroy
    render status: :no_content
  end

  private

    def set_ent
      @ent = Enterprise.find(params[:id])
    end

    def ent_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params,
        only: [
          :name, :developer_id, :operator_id,
          :district, :address, :contact, :contact_position,
          :contact_telephone, :contact_otherinfo, :remarks, :code
        ]
      )
    end
end
