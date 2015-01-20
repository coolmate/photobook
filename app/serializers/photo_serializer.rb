class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :shape, :offset_left, :offset_top
end
