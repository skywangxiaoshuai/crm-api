class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit
  before_action :current_user

  # Transform '-' to '_' in the keys of attributes in the request body, only json api data.
  before_action :transform_param_keys

  # 分页信息的元数据
  # meta of pagination
  def pagination_dict(object)
   {
    #  current_page: object.current_page,
    #  next_page: object.next_page,
    #  prev_page: object.prev_page,
    #  total_pages: object.total_pages,
     total_count: object.total_count
   }
  end

  # 验证当前用户
  def current_user
    authenticate_or_request_with_http_token do |token, options|
      payload = JsonWebToken.decode(token)
      if payload
        @current_user ||= User.find_by_id(payload[:user_id])
      else
        render status: :unauthorized
      end
    end
  end


  def transform_param_keys
    # params[:data][:attributes].transform_keys! { |key| key.to_s.tr("-", "_") } if request.headers.include?('Content-Type') && request.headers['Content-Type'] == 'application/vnd.api+json'
    if params[:data] && params[:data][:attributes]
      params[:data][:attributes].transform_keys! { |key| key.to_s.tr("-", "_") }
    end
  end


end
