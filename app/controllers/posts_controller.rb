class PostsController < ApplicationController
  def index
    @articles = Article.all.limit(10).order(created_at: :desc) 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


private
  def post_params
    params.require(:post).permit(:text, :title, :today, :time).merge(user_id: current_user.id)
  end

end