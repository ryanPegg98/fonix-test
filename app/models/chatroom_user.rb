class ChatroomUser < ApplicationRecord
  # enums
  enum role: { user: 0, admin: 1 }

  # Associations
  belongs_to :chatroom
  belongs_to :user
end
