class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.all
    recruit_user = Recruitment.where(user_id: current_user.id)
    @recruit_user = RecruitUser.where(recruitment_id: recruit_user)
    @recruit_users = RecruitUser.where(user_id: current_user.id, join: true)
    @recruit = RecruitUser.pluck(:recruitment_id)
    @user_rooms = UserRoom.all
    p @user_rooms
    
   

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

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @user = User.search(params[:search])
    @keyword = params[:keyword]
  render "index"
  end

  def user_params
    params.require(:user).permit(:name, :email, :area_id, :instrument_id, :introduction, :profile_image, :role)
  end
  
end
