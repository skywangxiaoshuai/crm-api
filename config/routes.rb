Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User 用户
  post '/login', to: 'users#login'
  get '/current_user', to: 'users#get_current_user'
  get '/search_user', to: 'users#search_user'
  put '/users/:id/reset_password', to: 'users#reset_password'
  put '/users/:id/init_password', to: 'users#init_password'
  get '/users/:position', to: 'users#get_all_users_on_one_position'
  resources :users, only: [:index, :create, :edit, :update, :destroy]

  # Block 区块
  get '/blocks/search', to: 'blocks#search_block_by_name'
  get '/blocks', to: 'blocks#search_blocks_by_name_or_description'
  get '/users/:user_id/blocks', to: 'blocks#index_user_blocks'
  post '/blocks', to: 'blocks#create'
  resources :blocks, only: [:edit, :update, :destroy]

  # districts 地区
  get '/districts/:id/subdistricts', to: 'districts#index_subdistricts'

  # category 类别
  get '/categories/:id/subcategories', to: 'categories#index_subcategories'

  # ent 企业
  get '/enterprises/search', to: 'enterprises#search_ent_by_name'
  get '/enterprises', to: 'enterprises#search_ent_by_name_code_developer_operator'
  resources :enterprises, only: [:index, :create, :show, :edit, :update, :destroy]


  # store 商铺
  get 'stores/search', to: 'stores#search_store_by_name'
  get '/stores', to: 'stores#search_store_by_multiple_params'
  get '/district/stores', to: 'stores#search_store_by_district'
  get '/category/stores', to: 'stores#search_store_by_category'
  # get '/stores', to: 'stores#search_store_by_category_and_district'
  # get '/users/:user_id/stores', to: 'stores#index_user_stores'
  get '/blocks/:block_id/stores', to: 'stores#index_block_stores'
  resources :stores, only: [:create, :show, :edit, :update, :destroy]

  # Picture 图片
  post '/stores/:store_id/pictures', to: 'pictures#create_store_picture'
  post '/enterprises/:enterprise_id/pictures', to: 'pictures#create_ent_picture'
  resources :pictures, only: [:destroy]

  # Service 服务
  get '/stores/:id/services', to: 'services#index_services_of_store'
  resources :services, only: [:index, :create, :edit, :update, :destroy]

  # Cooperation 商铺与服务的合作关系
  get '/stores/:id/cooperations', to: 'cooperations#index'
  post '/stores/:id/cooperations', to: 'cooperations#create'
  get '/cooperations/stores/services', to: 'cooperations#edit'
  put '/cooperations/stores/services', to: 'cooperations#update'
  delete '/cooperations/stores/services', to: 'cooperations#destroy'
  resources :cooperations, only: [:edit, :update, :destroy]

  # Trade 交易流水
  get '/trades', to: 'trades#get_trades'

  # Town block所属的乡镇街道
  get '/towns', to: 'towns#search_towns_by_name'
end
