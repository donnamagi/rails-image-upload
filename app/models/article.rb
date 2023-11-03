class Article < ApplicationRecord
  has_one :image_gallery, as: :galleryable, dependent: :destroy
end