class Public::UserRoomsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user_room = UserRoom.new(user_room_params)
    user = User.find_by(id: @user_room.user_id)
    if @user_room.save
      user.create_notification_add_room!(current_user)
      redirect_to request.referer
    else
      flash[:notice] = "空欄の箇所を入力して下さい"
    end
  end

  def update 
    user_room = UserRoom.find(params[:id])
    if user_room.update(user_room_params)
      redirect_to  request.referer
    else
      render 'show'
    end
  end
  
  private
  def user_room_params
    params.require(:user_room).permit(:room_id, :user_id, :activation)
  end
end
