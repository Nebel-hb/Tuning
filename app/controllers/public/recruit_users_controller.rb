class Public::RecruitUsersController < ApplicationController
  def create
    recruit_user = RecruitUser.new(recruit_user_params)
    recruitment = recruit_user.recruitment_id
    recruit_user.user_id = current_user.id

    if recruit_user.save
      # redirect_to recruitments_path
      redirect_to recruitment_path(recruitment)
    end
  end

  def index
    @recruit_users = RecruitUser.all
    @recruitment = params[:recruitment].to_i
    @room = Room.new
    @rooms = Room.all
    # @rooms = Room.where(user_id: current_user.id)
    
  end

  def destroy
    @recruit_user = RecruitUser.find(params[:id])
    @recruit_user.destroy
    redirect_to request.referer
  end

  def update
    @recruit = RecruitUser.find(params[:id])
    @recruit_user = @recruit.update(recruit_user_params)
    @recruitment = @recruit_user.recruitment_id
    redirect_to recruitment_path(@recruitment)

  end

  def recruit_user_params
    params.require(:recruit_user).permit( :recruitment_id, :join, :recruit_comment)
  end
  def room_params
    params.require(:room).permit(:room_name, :user_id)
  end
end
