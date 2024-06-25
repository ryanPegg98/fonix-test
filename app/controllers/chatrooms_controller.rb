# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show edit update destroy]

  def index
    @chatrooms = Chatroom.all.order(name: :asc)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save && @chatroom.chatroom_users.create(user: current_user)
      redirect_to chatroom_path(@chatroom), notice: t('chatrooms.notices.created')
    else
      render :new
    end
  end

  def show
    @new_message = Message.new
  end

  def edit; end

  def update
    if @chatroom.update(chatroom_params)
      redirect_to chatroom_path(@chatroom), notice: t('chatrooms.notices.updated')
    else
      render :edit
    end
  end

  def destroy
    if @chatroom.destroy
      redirect_to chatroom_path(@chatroom), notice: t('chatrooms.notices.deleted')
    else
      redirect_to chatroom_path(@chatroom), alert: t('chatrooms.alerts.delete')
    end
  end

  def join
    @chatroom = Chatroom.find_by(id: params[:chatroom_id])

    if @chatroom.chatroom_users.find_or_create_by(user: current_user)
      redirect_to chatroom_path(@chatroom), notice: t('chatrooms.notices.joined')
    else
      redirect_to chatrooms_path, alert: t('chatroom.alerts.empty')
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def set_chatroom
    @chatroom = current_user.chatrooms.find_by(id: params[:chatroom_id].presence || params[:id])
  end
end
