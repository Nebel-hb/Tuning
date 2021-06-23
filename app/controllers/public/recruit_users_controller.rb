class Public::RecruitUsersController < ApplicationController
  def create
    recruit_user = RecruitUser.new(recruit_user_params)
    recruitment = recruit_user.recruitment_id
    recruit_user.user_id = current_user.id

    # 申請通知用
    recruit = Recruitment.find_by(id: recruitment)
    recruitment_user = recruit.user_id
    user = User.find_by(id: recruitment_user)
    if recruit_user.save

      user.create_notification_join!(current_user)
      redirect_to recruitment_path(recruitment)
    else
      flash[:notice] = "空欄の箇所を入力して下さい"
      render'recruitment/show'
    end
  end

  def index
    @recruit_users = RecruitUser.all
    @recruitment = params[:recruitment].to_i
    @user_room = UserRoom.new
    @user_rooms = UserRoom.all
    @room = Room.new
    @rooms = Room.where(user_id: current_user.id)
    @users_room = Room.where(recruitment_id: @recruitment)

  end

  def destroy
    @recruit_user = RecruitUser.find(params[:id])
    @recruit_user.destroy
    redirect_to request.referer
  end

  def update
    @recruit = RecruitUser.find(params[:id])
    if @recruit_user = @recruit.update(recruit_user_params)
    thank_you_comment = ThankYouComment.find_by(recruitment_id: @recruit.recruitment_id, user_id: @recruit.user_id)
    p thank_you_comment
    # thank_you_comment.join = 1
    p thank_you_comment
    # thank_you_comment.update(thank_you_comment_params)
    redirect_to request.referer
    end
  end

 private
  def recruit_user_params
    params.require(:recruit_user).permit( :recruitment_id, :join, :recruit_comment)
  end
  def room_params
    params.require(:room).permit(:room_name, :user_id, :recruitment_id)
  end
  def user_room_params
    params.require(:user_room).permit(:room_id, :user_id, :message)
  end
  def thank_you_comment_params
    params.permit(:room_id, :user_id)
  end
end
