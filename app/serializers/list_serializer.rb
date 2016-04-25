class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  has_many :items
end
