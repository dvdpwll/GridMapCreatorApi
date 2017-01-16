class AddLayerToElements < ActiveRecord::Migration
  def change
    add_column :elements, :layer, :integer
  end
end
