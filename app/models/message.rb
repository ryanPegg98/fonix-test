# frozen_string_literal: true

class Message < ApplicationRecord
  # Validations
  validates :content, presence: true

  # Associations
  belongs_to :chatroom_user

  # Scopes

  scope :since_day, lambda { |date|
    where('messages.created_at::DATE > ?', date)
  }

  scope :since_time, lambda { |time|
    where('messages.created_at > ?', time)
  }

  # Callbacks
  after_create_commit lambda {
                        broadcast_append_to "chatroom_#{chatroom_user.chatroom_id}", partial: 'messages/message', locals: { message: self },
                                                                                     target: 'messages'
                      }
end
