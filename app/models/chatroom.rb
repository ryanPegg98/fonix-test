class Chatroom < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Associations
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
end
