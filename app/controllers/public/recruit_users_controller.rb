class Public::RecruitUsersController < ApplicationController
  before_action :authenticate_user!
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
    # @recruit_users = RecruitUser.page(params[:page]).per(5)
    @recruitment = Recruitment.find_by(id: params[:recruitment].to_i)
    @user_room = UserRoom.new
    @user_rooms = UserRoom.all
    @room = Room.new
    @rooms = Room.where(user_id: current_user.id)
    @users_room = Room.where(recruitment_id: @recruitment.id)
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: RecruitRelation.find_by(recruitment_id: @recruitment.id).id).pluck(:instrument_id)
    @instruments = Instrument.where(id: @recruit_instruments)
    recruit_users = RecruitUser.where(recruitment_id: @recruitment)
    @recruit_user = User.where(id: recruit_users.pluck(:user_id))
    @thank_you_comment = ThankYouComment.new
  end

  def destroy
    @recruit_user = RecruitUser.find(params[:id])
    @recruit_user.destroy
    redirect_to request.referer
  end

  def update
    @recruit = RecruitUser.find(params[:id])
    @recruit_user = @recruit.update(recruit_user_params)
    recruitment = @recruit.recruitment_id
    instrument = RecruitInstrument.find_by(instrument_id: @recruit.instrument_id, recruit_relation_id: RecruitRelation.find_by(recruitment_id: recruitment).id)
    recruit_instrument = instrument.finded_people.to_i + 1
    instrument.update(finded_people: recruit_instrument)
    unless  ThankYouComment.where(recruitment_id: recruitment, user_id: @recruit.user_id).nil?
      ThankYouComment.where(recruitment_id: recruitment, user_id: @recruit.user_id).update(join: true)
    end
    if instrument.need_people == instrument.finded_people
      instrument.update(find_all: true)
    end

    redirect_to request.referer
  end

 private
  def recruit_user_params
    params.require(:recruit_user).permit( :recruitment_id, :join, :recruit_comment, :instrument_id)
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
  def recruitment_params
    params.permit(:recruitment)
  end
  def recruit_instrument_params
    params.permit(:recruit_instrument)
  end
end
