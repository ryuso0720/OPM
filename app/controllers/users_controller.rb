class UsersController < ApplicationController

  def index
    @posts = Post.where(user_id: current_user[:id])
  end

  def edit
  end

  def show
    @posts = Post.where(user_id: current_user[:id])
    render "users/#{params[:name]}", locals: {user: current_user}
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
end
