class Public::RoomsController < ApplicationController

  def index

  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
    @users = UserRoom.where(room_id: @room)
    # @user_room = UserRoom.find(params[:id])
    p @users
  end

  def new
  end

  def create
    @room = Room.new(room_params)
    if @room.save!
      @user_room = @room.user_rooms.new
      @user_room.room_id = @room.id     
      @user_room.user_id = @room.user_id
      @user_room.activation = true
      @user_room.save!
      redirect_to request.referer
    end
  end


  def destroy
  end

private
  def room_params
    params.require(:room).permit(:room_name, :user_id, :recruitment_id)
  end
  
  def user_room_params
    params.require(:user_room).permit(:room_id, :user_id, :message)
  end
end
