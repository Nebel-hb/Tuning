class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # 接続された時
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # 切断された時
  end

  def speak(message)
    chat = Chat.new(message: message['message'][0], user_id: message['message'][1].to_i, room_id: message['message'][2].to_i)
    chat.save
    ActionCable.server.broadcast 'room_channel', message: render_message(chat), user_id: message['message'][2], id: chat.id, time: chat.created_at.strftime('%H:%M') # フロントへ返します

  end
  private
  def render_message(chat)
    ApplicationController.renderer.render partial: 'public/rooms/chat', locals: { chat: chat }
  end
end