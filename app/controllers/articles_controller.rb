class ArticlesController < ApplicationController

  def index
    articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])

    if params[:image_gallery_id].present?
      image_gallery = ImageGallery.find(params[:image_gallery_id])
      image_gallery.update(galleryable: @article) if image_gallery.galleryable_id.blank?
    end

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image_gallery_id)
  end

end