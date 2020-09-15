class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :permissions, :user_id

  has_many :items
end
