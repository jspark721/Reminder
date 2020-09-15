class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :days_left, :completed
end
