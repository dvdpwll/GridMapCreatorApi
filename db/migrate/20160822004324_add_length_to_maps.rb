class AddLengthToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :length, :integer
  end
end
