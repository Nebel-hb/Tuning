class Public::ThankYouCommentsController < ApplicationController
  def index
    @thank_you_comments = ThankYouComment.where(user_id: current_user.id)   
  end  
  def thanks
    @recruitment = Recruitment.find(params[:id])
    @recruit_users = RecruitUser.where(recruitment_id: @recruitment.id)
    @recruit_user = User.where(id: @recruit_users.pluck(:user_id))
    @thank_you_comment = ThankYouComment.new

  end  
  
  def create
    # 申請通知用
    # recruit = Recruitment.find_by(id: thank_you_comment.recruitment_id)
    # recruitment_user = recruit.user_id
  
    thank_you_comment = ThankYouComment.new(thank_you_comment_params)
    thank_you_comment.save
    user = User.find_by(id: thank_you_comment.user_id)
    recruitment = thank_you_comment.recruitment_id
    user.create_notification_thanks!(current_user)
    redirect_to recruitment_path(recruitment)
    
  end

  
  def update
     @thank_you_comment = ThankYouComment.find(params[:id])
     @thank_you_comment.update(thank_you_comment_params)
  
    redirect_to recruit_users_path
  end  
  
  private
    def thank_you_comment_params
      params.require(:thank_you_comment).permit(:recruitment_id, :user_id, :thanks_comment)
    end
end