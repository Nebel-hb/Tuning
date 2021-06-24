class Admin::UsersController < ApplicationController
  before_action :if_not_admin
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

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
