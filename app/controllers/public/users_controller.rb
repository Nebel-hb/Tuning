class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @orchestra = Orchestra.find_by(user_id: @user)

  end

  def edit
    @user = current_user
  end

  def update
    # @user = current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def user_params

    params.require(:user).permit(:name, :email, :area_id, :instrument_id, :introduction, :profile_image, :role)

  end
end
