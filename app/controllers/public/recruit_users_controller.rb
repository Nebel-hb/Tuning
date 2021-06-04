class Public::RecruitUsersController < ApplicationController
  def create

    recruitment = Recruitment.find(params[:recruitment_id])
    comment = Recruit_user.new(recruit_user_params)

    if comment.save
      redirect_to recruitment_path(recruitment)
    else
      render 'index'
    end
  end

  def index
  end
  
  def recruit_user_params
    params.require(:recruit_user).permit(:user_id, :recruitment_id, :join, :recruitment_comment)
  end
end
