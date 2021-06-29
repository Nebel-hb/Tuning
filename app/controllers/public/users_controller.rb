class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    search_value = params[:q][:name_cont] if params[:q]
    if search_value =~  /^[0-9]+$/

      params[:q][:name_cont] = ""
      params[:q][:id_eq] = search_value
    end
    @q = User.ransack(params[:q])
    @search = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.all
    recruit_user = Recruitment.where(user_id: @user.id)
    @recruit_user = RecruitUser.where(recruitment_id: recruit_user,join:1)
    @recruit_users = RecruitUser.where(user_id: @user.id)
    @recruit = RecruitUser.pluck(:recruitment_id)
    @user_rooms = UserRoom.all



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

private
  def user_params
    params.require(:user).permit(:name, :email, :area_id, :instrument_id, :introduction, :profile_image, :role)

  end
end
