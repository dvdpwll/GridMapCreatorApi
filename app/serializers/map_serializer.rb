# LKFDA
class MapSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  # has_one :user
end
