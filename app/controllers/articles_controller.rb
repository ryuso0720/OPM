class ArticlesController < ApplicationController

  before_action :correct_user, only: [:edit]
  before_action :set_find,only:[:show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:show, :search]
  before_action :move_to_session, only: [:new, :edit]

  def new
    @article = Article.new
    @article.photos.build
  end

  def show
  end

  def create
    @article = Article.new(create_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article.photos
  end

  def update
    if @article.update(create_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def search
    @articles = Article.search(params[:keyword]).page(params[:page]).per(10).order("created_at DESC")
  end

  private
  def create_params
    params.require(:article).permit(:body, :title, photos_attributes: [:image, :image_cache, :id ,:_destroy]).merge(user_id: current_user.id)
  end

  def correct_user
    @article = Article.find(params[:id])
    redirect_to root_path if current_user.id != @article.user_id
  end

  def set_find
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

end
