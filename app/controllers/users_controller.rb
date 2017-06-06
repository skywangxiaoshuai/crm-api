class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_user, only: [:edit, :update, :destroy, :reset_password, :init_password]
  skip_before_action :current_user, only: [:login]

  # 返回所有用户 // 有分页
  # GET /users
  def index
    # authorize User
    users = User.all.order(created_at: :desc)
                .page(params[:page][:number])
                .per(params[:page][:size])
    render status: :ok, json: users, EachSerializer: UserSerializer,
           meta: pagination_dict(users)
  end

  # 返回所有BD专员 / 返回所有运营专员
  # GET /users/:position
  def get_all_users_on_one_position
    users = User.with_role(params[:position].to_sym)
    render status: :ok, json: users, EachSerializer: UserSerializer
  end

  # 新建用户
  # POST /users
  def create
    authorize User
    # binding.pry
    parameters = user_params.slice(:name, :password, :password_confirmation)

    user = User.new(parameters)
    if user.save && user.add_role(user_params[:role].to_sym)
      render status: :created, json: user, Serializer: UserSerializer
    else
      render status: :unprocessable_entity, json: user,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 编辑用户
  # GET /users/:id/edit
  def edit
    # binding.pry
    authorize @user
    render status: :ok, json: @user
  end

  # # 提交编辑
  # # PUT /users/:id
  def update
    authorize @user
    parameters = {}
    parameters[:name] = user_params[:name]
    role = @user.roles_name[0]
    if role && role != user_params[:role]
      @user.remove_role(role.to_sym)
    end

    if @user.update(parameters) && @user.add_role(user_params[:role].to_sym)
      render status: :ok, json: @user, Serializer: UserSerializer
    else
      render status: :unprocessable_entity, json: @user,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 删除用户
  # DELETE /users/:id
  def destroy
    authorize @user
    if current_user.id == @user.id
      @user.errors.add(:name, "管理员不能删除自己的账号")
      return render status: :unauthorized, json: @user,
                    serializer: ActiveModel::Serializer::ErrorSerializer
    end

    if @user.destroy
      render status: :no_content
    else
      render status: :unprocessable_entity, json: @user,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 查找用户
  # GET /search?q=zhangsan
  # def search_user
  #   users = User.where("name like ?", "%#{params[:q]}%").includes(:shops)
  #   render status: :ok, json: users, EachSerializer: UserSerializer
  # end

  # 用户登陆
  # POST /login
  def login
    name = params[:data][:attributes][:name]
    password = params[:data][:attributes][:password]
    user = User.find_by(name: name)
    if user && user.authenticate(password)
      exp = Time.now + 10.days  # 10天过期
      payload = { user_id: user.id, exp: exp }
      jwt = JsonWebToken.encode(payload)
      response.headers['Authorization'] = "Bearer #{jwt}"
      render status: :created
    else
      render status: :unauthorized
    end
  end

  # 获取当前用户
  # get /current_user
  def get_current_user
    render status: :ok, json: @current_user, Serializer: UserSerializer
  end

  # 修改密码
  # PUT /users/:id/reset_password
  def reset_password
    authorize @user
    parameters = reset_password_params.slice(:password, :password_confirmation)
    if @user.authenticate(reset_password_params[:old_password]) && @user.update(parameters)
      render status: :ok, json: @user, Serializer: UserSerializer
    else
      render status: :unprocessable_entity, json: @user,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 初始化密码
  # PUT /users/:id/init_password
  def init_password
    # binding.pry
    authorize @user
    parameters = {}
    parameters[:password] = "123456"
    parameters[:password_confirmation] = "123456"
    if @current_user.id != @user.id && @user.update(parameters)
      render status: :ok, json: @user, Serializer: UserSerializer
    elsif @current_user.id == @user.id
      @user.errors.add(:name, "管理员不能重置自己的密码")
      render status: :unprocessable_entity, json: @user,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params,
        only: [
          :name, :password, :password_confirmation, :role
        ]
      )
    end

    def reset_password_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params,
        only: [
          :old_password, :password, :password_confirmation
        ]
      )
    end
end
