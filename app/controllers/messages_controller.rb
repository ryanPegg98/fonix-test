# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_chatroom

  def new; end

  def create
    @message = @chatroom_user.messages.new(message_params)

    @new_message = if @message.save
                     Message.new
                   else
                     @message
                   end

    render :new
  end

  private

  def set_chatroom
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: params[:chatroom_id])
    @chatroom = @chatroom_user.chatroom
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
