class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :thing
      t.integer :order
      t.references :map, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
