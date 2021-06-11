class Public::ThankYouCommentsController < ApplicationController
  def thanks
    @recruitment = Recruitment.find(params[:id])
    @thank_you_comment_user = User.where(id: ThankYouComment.where(recruitment_id: @recruitment).pluck(:user_id))
    @thank_you_comment = ThankYouComment.find_by(recruitment_id: @recruitment, user_id: @thank_you_comment_user)

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
