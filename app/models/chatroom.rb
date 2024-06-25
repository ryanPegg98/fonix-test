# frozen_string_literal: true

class Chatroom < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Associations
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages, through: :chatroom_users

  def last_message_for_user_time(user)
    chatroom_user = chatroom_users.find_by(user:)

    chatroom_user.messages.last&.created_at.presence || chatroom_user.created_at
  end
end
