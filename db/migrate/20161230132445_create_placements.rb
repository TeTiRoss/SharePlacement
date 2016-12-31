class CreatePlacements < ActiveRecord::Migration[5.0]
  def change
    create_table :placements do |t|
      t.string :title
      t.string :address
      t.text :description
      t.json :photos
      t.decimal :price

      t.timestamps
    end
  end
end
