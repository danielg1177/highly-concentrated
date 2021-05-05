require 'pry'

class ChatsController < ApplicationController
  def index
    @chats = policy_scope(Chat)
    @messaged_by = []
    unless @chats.size.zero?
      chats_unique = @chats.uniq { |chat| chat.sender || chat.receiver }
      chats_unique.each do |chat|
        if chat.receiver == current_user && chat.sender != current_user
          @messaged_by << chat.sender
        elsif chat.sender == current_user && chat.receiver != current_user
          @messaged_by << chat.receiver
        end
      end
    end
  end

  def new
    @chat = Chat.new
    authorize @chat
    @ganja = Ganja.find(params[:ganja_id])
    @chat.sender = current_user
    @chat.receiver = @ganja.user
  end

  def create
    @chat = Chat.new(chat_params)
    authorize @chat
    @sender = User.find(params[:user_id])
    @chat.sender = current_user
    @chat.receiver = @sender
    if @chat.save
      redirect_to user_show_messages_path(@sender, anchor: "review-#{@chat.id}")
    else
      render "users/#{@sender}/chats/messages"
    end
  end

  def messages
    @sender = User.find(params[:user_id])
    @chats = policy_scope(Chat)
    @chat = Chat.new
    if @chats
      authorize @chats
      @chats = @chats.filter { |chat| chat.sender == @sender || chat.receiver == @sender }
    else
      @chats = Chat.new
      authorize @chats
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :sender, :receiver)
  end
end
