# app/channels/messages_channel.rb
class MessagesChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_#{params[:chat_id]}"
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  
    def speak(data)
      message = Message.create!(
        content: data['message'],
        user_id: current_user.id,
        chat_id: params[:chat_id]
      )
      Rails.logger.info "Broadcasting message: #{message.inspect}"
      ActionCable.server.broadcast("chat_#{params[:chat_id]}", render_message(message))
    end
  
    private
  
    def render_message(message)
      ApplicationController.renderer.render(
        partial: 'messages/message',
        locals: { message: message }
      )
    end
  end
  