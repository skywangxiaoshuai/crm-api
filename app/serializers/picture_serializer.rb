class PictureSerializer < ActiveModel::Serializer
  attributes :url

  def url
    object.picture.url
  end
end
