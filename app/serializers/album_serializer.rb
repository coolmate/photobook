class AlbumSerializer < ActiveModel::Serializer
  attributes :token, :name
  has_many :pages
end
