# mkfgl
class ElementSerializer < ActiveModel::Serializer
  attributes :id, :thing, :order, :layer
  has_one :map
end
