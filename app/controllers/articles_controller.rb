class ArticlesController < ApplicationController

  def index
    @articles = Article.all.includes({:image_gallery => :images}).last(3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # tying the image gallery to the article
      associate_image_gallery_with(@article) if params[:image_gallery_id].present?
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image_gallery_id)
  end

end