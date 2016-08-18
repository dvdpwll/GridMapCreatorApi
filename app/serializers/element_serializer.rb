class ElementSerializer < ActiveModel::Serializer
  attributes :id, :thing, :order
  # has_one :map
end
