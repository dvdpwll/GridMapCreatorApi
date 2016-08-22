# LKFDA
class MapSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :length, :height
  # has_one :user
end
