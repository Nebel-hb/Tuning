class Public::ThankYouCommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @thank_you_comments = ThankYouComment.where(user_id: params[:user])
    score = 0
    @thank_you_comments.each do |comment|
    score += comment.score
    end
    if @thank_you_comments.count != 0
      @total_score = score / @thank_you_comments.count
    else
      @total_score = 0
    end
  end

  def create
    # 申請通知用
    thank_you_comment = ThankYouComment.new(thank_you_comment_params)
    unless RecruitUser.find_by(user_id: thank_you_comment.user_id, recruitment_id: thank_you_comment.recruitment_id, join: 2).nil?
      thank_you_comment.join = true
    end
    thank_you_comment.score = Language.get_data(thank_you_comment_params[:thanks_comment]) #natural language
    if thank_you_comment.save!
      user = User.find_by(id: thank_you_comment.user_id)
      user.create_notification_thanks!(current_user)
      flash[:notice] = "コメントを送信しました"
    redirect_to request.referer
    else
      flash[:alert] = "空欄の箇所を入力して下さい"
      render:thanks
    end
  end

  private
    def thank_you_comment_params
      params.require(:thank_you_comment).permit(:recruitment_id, :user_id, :thanks_comment)
    end
    def user_params
      params.permit(:user)
    end
end
