# frozen_string_literal: true

class StatsService
  TIME_SPAN = 7.days

  def self.perform!
    new.run!
  end

  def run!
    User.all.each do |user|
      send_mail(user, build_stats(user))
    end
  end

  private

  def build_stats(user)
    user.chatrooms.map do |chatroom|
      # TODO: This could be optimised by running a single query to fetch all the user information
      # TODO: The chatroom information could have been pulled before the map as it would not change from user to user
      last_message = chatroom.last_message_for_user_time(user)

      {
        chatroom:,
        message_count: chatroom.messages.since_day(TIME_SPAN.ago).size,
        since_last_message: chatroom.messages.since_time(last_message).size,
        users_last_message: last_message
      }
    end
  end

  def send_mail(user, stats)
    StatsMailer.with(user:, stats:).weekly_email.deliver_now
  end
end
