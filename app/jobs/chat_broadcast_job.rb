# class DirectChatBroadcastJob < ApplicationJob
#     queue_as :default

#     def perform(chat)
#       ActionCable.server.broadcast "room_channel_#{chat.room_id}", chat: render_chat(chat)
#     end

#     private

#     def render_chat(chat)
#       ApplicationController.renderer.render partial: 'post', locals: { chats: chats }
#     end
# end
