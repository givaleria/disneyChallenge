class CharacterMovieSerializer < ActiveModel::Serializer
  attributes :id
  has_one :character
  has_one :movie
end
