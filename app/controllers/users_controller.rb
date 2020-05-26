class UsersController < ApplicationController

  before_action :move_to_session, only: [:new, :edit]

  def index
    @posts = Post.where(user_id: current_user[:id]).order(created_at: :desc) 
  end

  def edit
  end

  def show
    @posts = Post.where(user_id: current_user[:id])
    # @pesonal = Personal.find(id: params[:id])
    # @pesonal = Personal.where(user_id: current_user[:id])
    render "users/#{params[:name]}", locals: {user: current_user}
  end

  def chart
    @posts = Post.where(user_id: current_user[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
