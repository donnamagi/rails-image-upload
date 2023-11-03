class ImageGallery < ApplicationRecord
  # A polymorphic association, so a gallery can belong to more than one type of model.
  # The 'optional: true' flag allows for flexibility, in case the gallery gets created before the main object.
  belongs_to :galleryable, polymorphic: true, optional: true 

  # A one-to-many relationship with Images. 
  # The acts_as_list gem is used for ordering the images.
  has_many :images, -> { order(position: :asc) }, dependent: :destroy

  # Enables the creation, updating, and deletion of associated images through the ImageGallery form.
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
end
