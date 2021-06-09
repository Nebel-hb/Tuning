class Public::OrchestrasController < ApplicationController
  def create

    @orchestra = Orchestra.new(orchestra_params)
    if @orchestra.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def new
    @orchestra = Orchestra.new
    # @user = current_user.id
  end

  private

  def orchestra_params
    params.require(:orchestra).permit(:application_comment, :user_id)
  end
end
