class ImageGalleriesController < ApplicationController

  before_action :set_gallery, only: %i[show]

  def show; end 

  def new
    @image_gallery = ImageGallery.new()
    @image_gallery.images.build
  end

  def create
    @image_gallery = ImageGallery.new(image_gallery_params)

    respond_to do |format|
      if @image_gallery.save
        format.html {redirect_to image_gallery_path(@image_gallery)}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end 
  end

  private

  def set_gallery
    @image_gallery = ImageGallery.find(params[:id])
  end

  def image_gallery_params
    params.require(:image_gallery).permit(:galleryable_id, :galleryable_type, images_attributes: [:id, :picture])
  end

end