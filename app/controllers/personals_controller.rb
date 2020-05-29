class PersonalsController < ApplicationController

  # before_action :move_to_personal, only: [:edit]

  def new
    @user = User.find(params[:user_id])
    @personal = Personal.new
  end

  def create
    @personal = Personal.create(personal_params)
    if @personal.save
      redirect_to root_path
    else
      redirect_to new_user_personal_path
    end
  end

  def edit
    @personal = Personal.find(params[:id])
    
    # @user = User.find(params[:id])
    # @personal = Personal.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @personal = Personal.find(params[:id])
    if @personal.update(personal_params)
      redirect_to users_path
    else
      flash.now[:alert] = 'Please enter your profile image and profile text.'
      render "edit"
    end
  end


  private

  def personal_params
    params.require(:personal).permit(:profile, :icon_image).merge(user_id: current_user.id)
  end

  def move_to_personal
    redirect_to root_path unless current_user.personal.present?
  end

end
