# frozen_string_literal: true

class StatsMailer < ApplicationMailer
  def weekly_email
    @user = params[:user]
    @stats = params[:stats]

    mail(to: @user.email, subject: 'Weekly Chatroom Stats')
  end
end
