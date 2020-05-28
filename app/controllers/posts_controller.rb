class PostsController < ApplicationController

  before_action :move_to_session, only: [:new, :edit]

  def index
    @articles = Article.all.limit(10).order(created_at: :desc) 
    # @users = User.includes(:personals)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end


private
  def post_params
    params.require(:post).permit(:text, :title, :today, :time).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

end