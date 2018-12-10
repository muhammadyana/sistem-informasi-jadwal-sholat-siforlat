class MosqueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :latitude, :longitude, :slug, :city, :zipcode, :country, :avatar, :avatar_thumbnail

  def avatar
  	object.avatar.url
  end

  def avatar_thumbnail
  	object.avatar.thumbnail.url
  end
  # belongs_to :user
end
