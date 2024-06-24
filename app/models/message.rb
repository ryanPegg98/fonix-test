class Message < ApplicationRecord
  # Validations
  validates :content, presence: true

  # Associations
  belongs_to :chatroom_user
end
