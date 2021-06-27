class Public::ChatsController < ApplicationController
before_action :authenticate_user!
  def index
    # @user = User.find(params[:id])
    @user_room = UserRoom.find(params[:id])
    #if文の中で定義した@roomに紐づくchatsテーブルのレコードを代入
    @chats = @user_room.chats
    #@room.idを代入したChat.newを用意しておく(message送信時のform用)←筆者の表現が合っているか分かりません、、
    @chat = Chat.new(room_id: @user_room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    room = @chat.room
    if @chat.save
      room.create_notification_chat!(current_user, @chat.id)
      # redirect_to request.referer
      # render 'room/show'

    else
      flash[:notice] = "空欄の箇所を入力して下さい"
    #render 'public/rooms/show'
    end
    render 'public/rooms/create'
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :room_id)
    end
end
