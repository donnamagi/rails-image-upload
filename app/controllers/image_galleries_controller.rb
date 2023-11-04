class ImageGalleriesController < ApplicationController

  before_action :set_gallery, only: %i[show update delete_image]
  before_action :set_image, only: %i[delete_image]

  def show; end 

  def new
    @image_gallery = ImageGallery.new()
    @image_gallery.images.build
  end

  def create
    # if multiple images are uploaded at once, the pictures will be nested in an array
    # "images_attributes" => { "0" => { "picture" => [image, image2, image3] ...
    # this will be rejected, so we need to restructure the params hash
    handle_multiple_images if params[:image_gallery][:images_attributes]["0"][:picture].is_a?(Array)
    @image_gallery = ImageGallery.new(image_gallery_params)

    respond_to do |format|
      if @image_gallery.save
        format.html {redirect_to image_gallery_path(@image_gallery)}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end 
  end

  def update
    index = params[:image_gallery][:images_attributes].keys.last
    handle_multiple_images if params[:image_gallery][:images_attributes][index][:picture].is_a?(Array)

    respond_to do |format|
      if @image_gallery.update(image_gallery_params)
        format.html {redirect_to image_gallery_path(@image_gallery)}
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end 
  end

  def delete_image
    @image.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("image_#{@image.id}")
      end
      format.html { redirect_to image_gallery_path(@image_gallery) }
    end
  end

  private

  def handle_multiple_images
    # user might have already uploaded some images, so we get the last index
    index = params[:image_gallery][:images_attributes].keys.last
    pictures = params[:image_gallery][:images_attributes][index][:picture]
    
    restructured_pictures = 
      pictures.each_with_index.map do |picture, index|
        [index.to_s, { picture: picture }]
      end
    
    # "images_attributes" => { "0" => { "picture": image }, "1" => { "picture": image2 } ...
    params[:image_gallery][:images_attributes] = restructured_pictures.to_h
  end

  def set_gallery
    @image_gallery = ImageGallery.find(params[:id])
  end

  def set_image
    @image = Image.find(params[:image_id])
  end

  def image_gallery_params
    params.require(:image_gallery).permit(:galleryable_id, :galleryable_type, images_attributes: [:id, :picture])
  end

end