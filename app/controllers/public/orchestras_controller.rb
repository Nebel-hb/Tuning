class Public::OrchestrasController < ApplicationController
  def create

    @orchestra = Orchestra.new(orchestra_params)
    if @orchestra.save
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "空欄の箇所を入力して下さい"
      render:new
    end
  end

  def new
    @orchestra = Orchestra.new
  end

  private

  def orchestra_params
    params.require(:orchestra).permit(:application_comment, :user_id)
  end
end
