class PicturesController < ApplicationController
  include Utilities
  before_action :set_store, only: :create_store_picture
  before_action :set_ent, only: :create_ent_picture
  before_action :set_picture, only: :destroy
  # 添加商铺图片
  # POST /stores/:store_id/pictures
  def create_store_picture
    picture = @store.pictures.new(picture_params)
    if picture.save
      render status: :created, json: picture, Serializer: PictureSerializer
    else
      render status: :unprocessable_entity, json: picture,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 添加企业图片
  # POST /enterprises/:enterprise_id/pictures
  def create_ent_picture
    picture = @ent.pictures.new(picture_params)
    if picture.save
      render status: :created, json: picture, Serializer: PictureSerializer
    else
      render status: :unprocessable_entity, json: picture,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # 删除图片
  # DELETE /pictures/:id
  def destroy
    if @picture.destroy
      render status: :no_content
    else
      render status: :unprocessable_entity, json: @picture,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_ent
      @ent = Enterprise.find(params[:enterprise_id])
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      parameters = ActiveModelSerializers::Deserialization.jsonapi_parse(
        params,
        only: [:picture]
      )
      parameters[:picture] = adapt_to_base64(parameters[:picture]) if parameters[:picture]
      parameters
    end
end
