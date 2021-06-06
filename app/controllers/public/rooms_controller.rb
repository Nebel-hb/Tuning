class Public::RoomsController < ApplicationController
  
  def index
  
  end
  
  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
  end

  def new
  end

  def create
    @room = Room.new(room_params)
    @room.save
    if current_user.user_rooms.create(room_id: @room.id)
      redirect_to recruitments_path
    end
  end

  def destroy
  end

private
def room_params
  params.require(:room).permit(:room_name, :user_id)
end
end
