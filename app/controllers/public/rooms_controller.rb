class Public::RoomsController < ApplicationController

  def index
    @user_rooms = UserRoom.all
  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
    @users = UserRoom.where(room_id: @room)
    @users22 = @users.pluck(:user_id)
    @user = User.search(params[:search])
    @user_room = UserRoom.new
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(room_id: @room, checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end


  def create
    @room = Room.new(room_params)
    @user_room = UserRoom.new(user_room_params)
    if @room.save!
      @user_room = @room.user_rooms.new
      @user_room.room_id = @room.id
      @user_room.user_id = @room.user_id
      @user_room.activation = true
      @user_room.save!
      redirect_to request.referer
    else if @user_room.save!
      redirect_to request.referer

    end
    end
  end


  def destroy
  end

  def search
    if params[:search].present?
      @users = User.where('name LIKE ?', "%#{params[:search]}%")
    else
      @users = User.none
    end
    #Viewのformで取得したパラメータをモデルに渡す
    @user = User.search(params[:search])
    @user_room = UserRoom.new
    # @room = Room.find(params[:room_id])
    puts "===================="
    p @user

    # render "show"
  end

private
  def room_params
    params.require(:room).permit(:room_name, :user_id, :recruitment_id)
  end

  def user_room_params
    params.require(:user_room).permit(:room_id, :user_id, :message)
  end
end
