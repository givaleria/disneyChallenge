class MovieSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :date, :mark
  has_one :genre
end
