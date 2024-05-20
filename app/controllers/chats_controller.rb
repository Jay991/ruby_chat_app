class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: [:show]

  def index
    @chats = current_user.chats
  end

  def show
    @message = Message.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      @chat.chat_users.create(user: current_user)
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render :new
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:name, :chat_type)
  end
end
