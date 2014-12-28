class AlbumSerializer < ActiveModel::Serializer
  attributes :id
  has_many :pages
end
