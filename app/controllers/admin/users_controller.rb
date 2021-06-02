class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
   
  end

  def update
    # @user = current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_orchestras_path
    else
      render 'show'
    end
  end

  def user_params
    params.permit(:name, :email, :area_id, :instrument_id, :introduction, :profile_image, :role)

  end
end
