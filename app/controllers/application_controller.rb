class ApplicationController < ActionController::Base

  private

  def associate_image_gallery_with(galleryable)
    image_gallery = ImageGallery.find(params[:image_gallery_id])

    # checking for association to not allow "stealing" an existing gallery from another object
    image_gallery.update(galleryable: @article) if image_gallery.galleryable_id.blank?
  end
end
