# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  after_create_commit do
    broadcast_append_to "chat_#{chat.id}", target: "messages"
  end
end
