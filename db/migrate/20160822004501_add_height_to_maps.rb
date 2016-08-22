class AddHeightToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :height, :integer
  end
end
