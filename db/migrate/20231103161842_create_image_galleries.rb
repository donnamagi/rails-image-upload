class CreateImageGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :image_galleries do |t|
      t.references :galleryable, polymorphic: true, null: true
      t.timestamps
    end
  end
end
