class Image < ApplicationRecord
  belongs_to :image_gallery, optional: true
  has_one_base64_attached :picture

  # This allows images to be ordered within their gallery thanks to the acts_as_list gem
  acts_as_list scope: :image_gallery

  # Before destroying an image record, the associated picture file is removed from storage.
  before_destroy :purge_picture

  private

  def purge_picture
    picture.purge if picture.attached?
  end
end
