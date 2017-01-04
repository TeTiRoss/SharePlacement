class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.json :photos
      t.references :placement, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
