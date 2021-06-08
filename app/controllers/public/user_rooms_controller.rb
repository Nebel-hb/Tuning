class Public::UserRoomsController < ApplicationController
  
  def create
    @user_room = UserRoom.new(user_room_params)
    @user_room.save
    redirect_to request.referer
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
