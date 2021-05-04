class ChatsController < ApplicationController

  def index
    @chats = policy_scope(Chat)
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
    @ganja = Ganja.find(params[:ganja_id])
    @chat.sender = current_user
    @chat.receiver = @ganja.user
    if @chat.save
      redirect_to ganja_flower_path
    else
      render :new
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :sender, :receiver)
  end
end
