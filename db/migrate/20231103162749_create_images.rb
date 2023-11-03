class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :image_gallery, null: true, foreign_key: true
      t.integer :position
      t.timestamps
    end
  end
end
