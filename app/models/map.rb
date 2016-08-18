class Map < ActiveRecord::Base
  has_many :elements
  belongs_to :user
end
