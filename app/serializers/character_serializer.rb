class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :age, :weight, :history
end
