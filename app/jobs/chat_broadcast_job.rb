# class DirectMessageBroadcastJob < ApplicationJob
#   queue_as :default

#     def perform(direct_message)
#       ActionCable.server.broadcast "room_channel_#{direct_message.room_id}", direct_message: render_direct_message(direct_message)
#     end

#     private

#     def render_direct_message(direct_message)
#       ApplicationController.renderer.render partial: 'chat', locals: { chats: chats }
#     end
# end