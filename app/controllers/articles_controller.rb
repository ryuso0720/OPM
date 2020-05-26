class ArticlesController < ApplicationController

  before_action :correct_user, only: [:edit]

  def new
    @article = Article.new
    @article.photos.build
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(create_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:article).permit(:body, :title, photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def correct_user
    @article = Article.find(params[:id])
    redirect_to root_path if current_user.id != @article.user_id
  end
end
